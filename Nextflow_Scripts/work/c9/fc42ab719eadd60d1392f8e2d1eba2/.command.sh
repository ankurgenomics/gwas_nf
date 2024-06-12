#!/bin/bash -ue
plink2         --vcf 1000g_lpa_hg38.vcf.gz dosage=DS         --make-pgen         --double-id         --out 1000g_lpa_hg38.vcf         --threads 8         --memory 16384
