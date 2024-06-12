#!/bin/bash -ue
java -jar /opt/genomic-utils.jar csv-concat         --separator ' '         --output-sep '	'         --gz         --output Y1.regenie.tmp.gz         1000g_lpa_hg38.vcf.regenie.split_Y1.regenie.gz

zcat Y1.regenie.tmp.gz | awk 'NR<=1{print $0;next}{print $0| "sort -n -k1 -k2 -T $PWD"}' | bgzip -c > Y1.regenie.gz  
tabix -f -b 2 -e 2 -s 1 -S 1 Y1.regenie.gz
