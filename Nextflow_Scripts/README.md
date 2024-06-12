# nf-gwas

**nf-gwas** is a Nextflow pipeline to run biobank-scale genome-wide association studies (GWAS) analysis. The pipeline automatically performs numerous pre- and post-processing steps, integrates regression modeling from the REGENIE package and currently supports single-variant, gene-based and interaction testing. All modules are structured in sub-workflows which allows to extend the pipeline to other methods and tools in future. nf-gwas includes an extensive reporting functionality that allows to inspect thousands of phenotypes and navigate interactive Manhattan plots directly in the web browser. 



![image](docs/images/Figure2_example_report.png)

## Overall pipeline


![image](docs/images/Figure1_MetroMap_v02.jpg)



## Quick Start

1. Install [Nextflow](https://www.nextflow.io/docs/latest/getstarted.html#installation) (>=22.10.4)

2. Run the pipeline on a test dataset

```
nextflow run genepi/nf-gwas -r v1.0.8 -profile test,<docker,singularity,slurm,slurm_with_scratch>
```

3. Run the pipeline on your data

```
nextflow run genepi/nf-gwas -c <nextflow.config> -r v1.0.8 -profile <docker,singularity,slurm,slurm_with_scratch>
```

Please click [here](tests) for available test config files.

## Development

```
git clone https://github.com/genepi/nf-gwas
cd nf-gwas
docker build -t genepi/nf-gwas . # don't ignore the dot
nextflow run main.nf -profile test,development
```

## nf-test

nf-gwas makes use of [nf-test](https://github.com/askimed/nf-test), a unit-style test framework for Nextflow.

```
cd nf-gwas
curl -fsSL https://code.askimed.com/install/nf-test | bash
./nf-test test
```

