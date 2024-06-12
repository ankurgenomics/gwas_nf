#!/bin/bash -ue
java -jar /opt/genomic-utils.jar gwas-report         Y1.regenie.gz         --rsid RSID         --gene GENE_NAME         --annotation GENE         --peak-variant-Counting-pval-threshold 7.3         --peak-pval-threshold 1.5         --max-annotations 20         --format CSV         --binning BIN_TO_POINTS         --output Y1.binned.txt

java -jar /opt/genomic-utils.jar gwas-report         Y1.regenie.gz         --rsid RSID         --gene GENE_NAME         --annotation GENE         --peak-variant-Counting-pval-threshold 7.3         --peak-pval-threshold 1.5         --max-annotations 20         --title Y1         --format HTML         --output test.Y1.regenie.manhattan.html

Rscript -e "require( 'rmarkdown' ); render('gwas_report_template.Rmd',
    params = list(
        project = 'test',
        date = '`date`',
        version = '1.0.8',
        regenie_merged='Y1.regenie.gz',
        regenie_filename='Y1.regenie',
        phenotype_file='phenotype.validated.txt',
        phenotype='Y1',
        covariates='null',
        condition_list='null',
        interaction_gxe='null',
        interaction_gxg='null',
        phenotype_log='phenotype.validated.log',
        covariate_log='',
        regenie_step1_log='',
        regenie_step2_log='test.step2.log',
        plot_ylimit=0,
        annotated_tophits_filename='Y1.regenie.filtered.gz',
        binned_results='Y1.binned.txt',
        manhattan_annotation_enabled = TRUE,
        annotation_min_log10p = 7.3,
        r_functions='functions.R',
        rmd_pheno_stats='child_phenostatistics.Rmd',
        rmd_valdiation_logs='child_validationlogs.Rmd'
    ),
    intermediates_dir='$PWD',
    knit_root_dir='$PWD',
    output_file='$PWD/test.Y1.regenie.html'
)"
