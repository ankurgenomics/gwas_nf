#!/bin/bash -ue
plink2         --bfile example         --maf 0.01         --mac 100         --geno 0.1         --hwe 1e-15         --mind 0.1         --write-snplist         --write-samples         --no-id-header         --out example.qc         --make-bed         --threads 8         --memory 16384
