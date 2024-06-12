#!/bin/bash -ue
# qcfiles path required for keep and extract (but not actually set below)
regenie         --step 1         --bed example.qc         --extract example.qc.snplist         --keep example.qc.id         --phenoFile phenotype.validated.txt         --phenoColList  Y1,Y2                                                                                 --bsize 1000                  --lowmem --lowmem-prefix tmp_rg         --gz         --threads 8         --out regenie_step1_out         --use-relative-path
