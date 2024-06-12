# nf-gwas
**nf-gwas: A Modular and Scalable Nextflow Pipeline for Genome-Wide Association Studies (GWAS)**

**Overview**

nf-gwas is a comprehensive and flexible Nextflow pipeline designed to perform genome-wide association studies (GWAS) analysis. This pipeline automates numerous pre- and post-processing steps, integrates regression modeling from the REGENIE package, and supports single-variant, gene-based, and interaction testing. The modular structure of the pipeline allows for easy extension to incorporate additional methods and tools in the future. Furthermore, nf-gwas includes an extensive reporting functionality, enabling users to inspect thousands of phenotypes and navigate interactive Manhattan plots directly in the web browser.

### Process

The pipeline involves the following steps:

1. **Splitting Genotype Data by Ethnicity**:
   The pipeline begins by splitting the genotype data into separate datasets based on the ethnic groups provided in the `samples.txt` file. The script used for this step can be found at [Python_scripts](https://github.com/ankurgenomics/gwas_nf/blob/main/Python_scripts/README). The input files are available at [INPUT/RAW_data](https://github.com/ankurgenomics/gwas_nf/tree/c7c75fbb5578e83a4afa239becdf403c35ea006f/INPUT/RAW_data).
   The Python script used for splitting the genotype data is [split_genotype_by_ethinicity_2.py](https://github.com/ankurgenomics/gwas_nf/blob/c7c75fbb5578e83a4afa239becdf403c35ea006f/Python_scripts/split_genotype_by_ethinicity_2.py).
   The output files are stored at [Gentotype_splitted_as_per_ethnic_group](https://github.com/ankurgenomics/gwas_nf/tree/c7c75fbb5578e83a4afa239becdf403c35ea006f/INPUT/Gentotype_splitted_as_per_ethnic_group).

3. **Converting Continuous Phenotype to Binary Case/Control Phenotype (Optional)**:
   For certain workflows, it may be necessary to convert continuous phenotypes to binary case/control phenotypes. This can be achieved using the script [phenotype_txt_to_binary_ph.py](https://github.com/ankurgenomics/gwas_nf/blob/c7c75fbb5578e83a4afa239becdf403c35ea006f/Python_scripts/phenotype_txt_to_binary_ph.py).

4. **Nextflow Scripts for GWAS Analysis**:
   The ethnicity-based split genotype files are used as input for the next steps, which are performed using modular and scalable [Nextflow_Scripts](https://github.com/ankurgenomics/gwas_nf/tree/c7c75fbb5578e83a4afa239becdf403c35ea006f/Nextflow_Scripts).

5. **Quality Control and GWAS**:
   The Nextflow scripts perform standard quality control steps, including removing individuals and SNPs with high missingness for each ethnic group separately. They also perform GWAS for each ethnic group separately.

6. **Identifying Common Variants**:
   The scripts identify and report common variants across the different ethnic groups.

7. **Output**:
   The results of these analyses are stored at [OUTPUT](https://github.com/ankurgenomics/gwas_nf/tree/c7c75fbb5578e83a4afa239becdf403c35ea006f/OUTPUT).

## Overall pipeline

![image](https://github.com/ankurgenomics/gwas_nf/blob/main/Nextflow_Scripts/Pipeline_Final.jpg)

### Contact

For any inquiries or questions, please contact:

- [Ankur Sharma](mailto:ankur012@e.ntu.edu.sg)





