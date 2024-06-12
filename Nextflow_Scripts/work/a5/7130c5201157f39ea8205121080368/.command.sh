#!/bin/bash -ue
java -jar /opt/genomic-utils.jar csv-filter         --separator '	'         --output-sep '	'         --input Y1.regenie.gz         --limit 7.3         --filter-column "LOG10P"         --gz         --output Y1.regenie.tmp
csvtk sort Y1.regenie.tmp -t -kLOG10P:nr | gzip >  Y1.regenie.filtered.gz
rm Y1.regenie.tmp
