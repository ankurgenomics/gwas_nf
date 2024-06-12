# nf-gwas
**nf-gwas** is a Nextflow pipeline to run genome-wide association studies (GWAS) analysis. The pipeline automatically performs numerous pre- and post-processing steps, integrates regression modeling from the REGENIE package and currently supports single-variant, gene-based and interaction testing. All modules are structured in sub-workflows which allows to extend the pipeline to other methods and tools in future. nf-gwas includes an extensive reporting functionality that allows to inspect thousands of phenotypes and navigate interactive Manhattan plots directly in the web browser. .

## Quick Start

 Check documentation here : https://github.com/ankurgenomics/gwas_nf/blob/main/Nextflow_Scripts/README.md

1. Install [Nextflow](https://www.nextflow.io/docs/latest/getstarted.html#installation) (>=22.10.4)

2. Run the pipeline on a test dataset

```
nextflow run main.nf -r v1.0 -profile test,<docker,singularity,slurm,slurm_with_scratch>

```

3. Run the pipeline on your data

```
nextflow run main.nf-c <nextflow.config> -r v1.0 -profile <docker,singularity,slurm,slurm_with_scratch>
```

Please click [here](tests) for available test config files.

## Development

```
git clone https://github.com/ankurgenomics/gwas_nf.git
cd nf-gwas
nextflow run main.nf -profile test,development
```

## nf-test

nf-gwas makes use of [nf-test](https://github.com/askimed/nf-test), a unit-style test framework for Nextflow.

```
cd nf-gwas
curl -fsSL https://code.askimed.com/install/nf-test | bash
./nf-test test
```

##

## Contact

- [Ankur Sharma](mailto:ankur012@e.ntu.edu.sg)




