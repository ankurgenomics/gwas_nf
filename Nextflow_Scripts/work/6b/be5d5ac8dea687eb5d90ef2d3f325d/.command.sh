#!/bin/bash
set -e

# annotate with genes
java -jar /opt/genomic-utils.jar annotate-genes         --input 1000g_lpa_hg38.vcf.regenie.gz         --sep ' '         --chr CHROM         --pos GENPOS         --anno genes.hg38.v32.csv         --anno-columns GENE_CHROMOSOME,GENE_START,GENE_END,GENE_NAME,GENE_DISTANCE         --anno-chr GENE_CHROMOSOME         --anno-start GENE_START         --anno-end GENE_END         --output-sep ' '         --output-gzip         --output 1000g_lpa_hg38.vcf.regenie.genes.txt.gz

# annotate rsids with tabix-merge if file is provided
if [ -z rsids.tsv.gz ]
then
    mv 1000g_lpa_hg38.vcf.regenie.genes.txt.gz 1000g_lpa_hg38.vcf.regenie.annotated.txt.gz
else
    java -jar /opt/genomic-utils.jar annotate             --input 1000g_lpa_hg38.vcf.regenie.genes.txt.gz             --sep ' '             --chr CHROM             --pos GENPOS             --ref ALLELE0             --alt ALLELE1             --anno rsids.tsv.gz             --anno-columns REF,ALT,RSID             --strategy CHROM_POS_ALLELES             --output-sep ' '             --output-gzip             --output 1000g_lpa_hg38.vcf.regenie.annotated.txt.gz
fi

java -jar /opt/genomic-utils.jar regenie-split         --input 1000g_lpa_hg38.vcf.regenie.annotated.txt.gz         --dict 1000g_lpa_hg38.vcf.regenie.Ydict         --output 1000g_lpa_hg38.vcf.regenie.split_
