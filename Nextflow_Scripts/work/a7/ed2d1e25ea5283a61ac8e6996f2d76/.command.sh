#!/bin/bash -ue
java -jar /opt/genomic-utils.jar csv-concat         --separator ' '         --output-sep '	'         --gz         --output Y2.regenie.tmp.gz         1000g_lpa_hg38.vcf.regenie.split_Y2.regenie.gz

zcat Y2.regenie.tmp.gz | awk 'NR<=1{print $0;next}{print $0| "sort -n -k1 -k2 -T $PWD"}' | bgzip -c > Y2.regenie.gz  
tabix -f -b 2 -e 2 -s 1 -S 1 Y2.regenie.gz
