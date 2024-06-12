# nf-gwas
**nf-gwas** is a modular and scalabl Nextflow pipeline to run genome-wide association studies (GWAS) analysis. The pipeline automatically performs numerous pre- and post-processing steps, integrates regression modeling from the REGENIE package and currently supports single-variant, gene-based and interaction testing. All modules are structured in sub-workflows which allows to extend the pipeline to other methods and tools in future. nf-gwas includes an extensive reporting functionality that allows to inspect thousands of phenotypes and navigate interactive Manhattan plots directly in the web browser. .

## Process:

1- First we need to split the genotype data into separate datasets based on the ethnic groups provided in the <samples.txt file>.
 The Script and details of script can be traced at : https://github.com/ankurgenomics/gwas_nf/blob/main/Python_scripts/README
 The input files provided are at : https://github.com/ankurgenomics/gwas_nf/tree/c7c75fbb5578e83a4afa239becdf403c35ea006f/INPUT/RAW_data
 After using the python script https://github.com/ankurgenomics/gwas_nf/blob/c7c75fbb5578e83a4afa239becdf403c35ea006f/Python_scripts/split_genotype_by_ethinicity_2.py , we got the 4 ethinicity data at : https://github.com/ankurgenomics/gwas_nf/tree/c7c75fbb5578e83a4afa239becdf403c35ea006f/OUTPUT

 2- Optionally, for some workflows, we might have to convert continuous Phenotype to Binary Case/Control phenotype. This can be achieved using script : https://github.com/ankurgenomics/gwas_nf/blob/c7c75fbb5578e83a4afa239becdf403c35ea006f/Python_scripts/phenotype_txt_to_binary_ph.py

 3- Then we can use the Ethinicity based splitted genotype files as input to next steps using modular and scalable nextflow scripts : https://github.com/ankurgenomics/gwas_nf/tree/c7c75fbb5578e83a4afa239becdf403c35ea006f/Nextflow_Scripts
 
 4- Using this script, we performed standard QC steps including removing individuals and SNPs with high missingness for each ethnic group separately. 
 
 5- The same script also perfomed GWAS for each ethnic group separately.

 6- The script also Identified and reported common variants across the different ethnic groups.

 7- The results of these analysis are stored at https://github.com/ankurgenomics/gwas_nf/tree/c7c75fbb5578e83a4afa239becdf403c35ea006f/OUTPUT

 
## Contact

- [Ankur Sharma](mailto:ankur012@e.ntu.edu.sg)




