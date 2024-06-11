import pandas as pd

# Load the phenotype file
phenotype_file = 'phenotype_10000_samples_100cols.txt'
phenotype_df = pd.read_csv(phenotype_file, sep='\s+')

# Define the threshold (using the median as an example)
threshold = phenotype_df['Y1'].median()

# Convert to binary case/control
phenotype_df['Y1_binary'] = phenotype_df['Y1'].apply(lambda x: 2 if x >= threshold else 1)

# Save the new phenotype file
binary_phenotype_file = 'binary_phenotype_temus.phe'
phenotype_df[['FID', 'IID', 'Y1_binary']].to_csv(binary_phenotype_file, sep='\t', index=False, header=True)
