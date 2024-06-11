# Install necessary packages
# pip install pandas numpy

import pandas as pd
import numpy as np

# Load the sample information
sample_info = pd.read_csv('samples.txt', delim_whitespace=True)

# Ensure that sample_info has 'FID' and 'ETHNIC_GROUP' columns
if 'FID' not in sample_info.columns or 'ETHNIC_GROUP' not in sample_info.columns:
    raise ValueError("samples.txt must contain 'FID' and 'ETHNIC_GROUP' columns")

# Load the .fam file
fam_df = pd.read_csv('100000_variants_10000_samples_5_chromosomes.fam', delim_whitespace=True, header=None)
fam_df.columns = ['FID', 'IID', 'PID', 'MID', 'SEX', 'PHENOTYPE']

# Merge with sample_info to get ethnicity
merged_df = fam_df.merge(sample_info, on='FID')

# Split based on ethnicity
ethnicities = merged_df['ETHNIC_GROUP'].unique()

for ethnicity in ethnicities:
    subset_df = merged_df[merged_df['ETHNIC_GROUP'] == ethnicity]
    subset_df.to_csv(f'{ethnicity}_samples.fam', sep='\t', index=False, header=False)

# Load the .bim file
bim_df = pd.read_csv('100000_variants_10000_samples_5_chromosomes.bim', delim_whitespace=True, header=None)

# Function to read PLINK .bed files
def read_bed_file(bed_file, num_samples, num_variants):
    with open(bed_file, 'rb') as f:
        # Skip the first three bytes (PLINK .bed header)
        f.read(3)
        
        # Each genotype is stored in 2 bits, so we need to read in chunks of bytes
        genotype_data = np.fromfile(f, dtype=np.uint8)
    
    # Calculate the expected size
    expected_size = ((num_samples + 3) // 4) * num_variants
    
    # Ensure the data is the expected size
    if genotype_data.size != expected_size:
        raise ValueError("Unexpected .bed file size")

    # Reshape genotype data to (variants, packed samples)
    genotype_data = genotype_data.reshape((num_variants, (num_samples + 3) // 4))
    return genotype_data

# Read the original .bed file
bed_file = '100000_variants_10000_samples_5_chromosomes.bed'
genotype_data = read_bed_file(bed_file, len(fam_df), len(bim_df))

for ethnicity in ethnicities:
    # Load corresponding .fam file
    subset_fam_df = pd.read_csv(f'{ethnicity}_samples.fam', delim_whitespace=True, header=None)
    
    # Get the indices of the samples in the original .fam file
    indices = fam_df[fam_df['FID'].isin(subset_fam_df[0])].index.to_list()
    
    # Create a mask for the samples we want to keep
    mask = np.zeros(len(fam_df), dtype=bool)
    mask[indices] = True
    
    # Subset the genotype data
    num_samples = len(fam_df)
    num_variants = len(bim_df)
    packed_subset_genotype_data = np.zeros((num_variants, (len(indices) + 3) // 4), dtype=np.uint8)
    
    for i in range(num_variants):
        variant_data = genotype_data[i]
        subset_variant_data = np.zeros((len(indices) + 3) // 4, dtype=np.uint8)
        
        for j, index in enumerate(indices):
            byte_index = index // 4
            bit_offset = (index % 4) * 2
            genotype = (variant_data[byte_index] >> bit_offset) & 0b11
            
            subset_byte_index = j // 4
            subset_bit_offset = (j % 4) * 2
            subset_variant_data[subset_byte_index] |= (genotype << subset_bit_offset)
        
        packed_subset_genotype_data[i] = subset_variant_data
    
    # Save the subset .bed file
    with open(f'{ethnicity}_samples.bed', 'wb') as f:
        # Write the PLINK .bed header
        f.write(bytearray([108, 27, 1]))
        # Write the subset genotype data
        packed_subset_genotype_data.tofile(f)

    # Save the subset .bim file
    bim_df.to_csv(f'{ethnicity}_samples.bim', sep='\t', index=False, header=False)

print("Genotype data split by ethnicity successfully.")
