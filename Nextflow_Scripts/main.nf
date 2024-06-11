#!/usr/bin/env nextflow
/*
========================================================================================
    ankurgenomics/gwas_nf
========================================================================================
    Github : https://github.com/ankurgenomics/gwas_nf
    Author: Ankur Sharma
    ---------------------------
*/

nextflow.enable.dsl = 2

include { validateParameters; paramsHelp; paramsSummaryLog } from 'plugin/nf-validation'


if (params.help) {
   def citation = '\n' + WorkflowMain.citation(workflow) + '\n'
   def String command = "nextflow run ${workflow.manifest.name} --config test.conf"
   log.info paramsHelp(command) + citation
   exit 0
}

// Validate input parameters
if (params.validate_params) {
    validateParameters()
}

// Print summary of supplied parameters
log.info paramsSummaryLog(workflow)


include { NF_GWAS } from './workflows/nf_gwas'

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

workflow {
    NF_GWAS ()
}
