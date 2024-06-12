#!/bin/bash -ue
java -jar /opt/genomic-utils.jar gwas-report-index         --tab-name "Details and Phenotype"         --plots "test.Y2.regenie.manhattan.html,test.Y1.regenie.manhattan.html"         --tab-links "test.Y2.regenie.html,test.Y1.regenie.html"         --names "Y2,Y1"         --title "test"         --output index.html
