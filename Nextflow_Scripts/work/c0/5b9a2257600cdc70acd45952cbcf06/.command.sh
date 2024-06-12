#!/bin/bash -ue
java -jar /opt/genomic-utils.jar csv-filter         --separator '	'         --output-sep '	'         --input Y2.regenie.gz         --limit 7.3         --filter-column "LOG10P"         --gz         --output Y2.regenie.tmp
csvtk sort Y2.regenie.tmp -t -kLOG10P:nr | gzip >  Y2.regenie.filtered.gz
rm Y2.regenie.tmp
