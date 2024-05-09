---
title: Transcriptome Alignment
type: transcriptome-alignment
contributors: [Luke Silver, Anna Syme]
description: How-to Guide for Transcriptome alignment .
affiliation: [The University of Sydney, BioCommons Australia]
---

[Galaxy Australia](https://usegalaxy.org.au/) is capable of performing genome repeat masking and transcriptome alignment with stringtie and transdecoder

This How-to-Guide will describe the steps required to repeat your genome and align transcripts on the Galaxy Australia platform (see **Fig 1**), developed in consultations between the Bioplatforms Australia [Threatened Species Initiative](https://threatenedspeciesinitiative.com/), [Galaxy Australia](https://usegalaxy.org.au/), and the [Australian BioCommons](https://www.biocommons.org.au/).

If you need help, the Galaxy community is both approachable and helpful. [Ask them questions!](https://help.galaxyproject.org/)

## Quick start guide

1. [Login to Galaxy Australia](#register-and-login)
2. Create a new history
3. Upload your assembled reference genome and raw RNA sequecing reads (can be imported from Bioplatforms Australia Portal)
4. Load and execute workflows, using required options
  - Repeat masking
  - RNA seq QC and read trimming
  - Align reads to find transcripts
  - Combine transcripts
  - Extract longest transcripts
  - Convert outputs
5. Review workflow report and perform additional QC as needed
6. Re-run workflows, or individual tools, as needed

## How to cite the workflows

## The overall workflow


Further to this, a summary of the different elements of this assembly approach are detailed below:

| Process name     | Workflow name                             | Description                                                                          | Inputs                                                              | Outputs                                                                                                     |
| ---------------- | ----------------------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| UPLOAD FILES     | Not applicable                            | See the [different upload options](#upload-data-files).                                     |  reference genome, Fastq mRNA | Uploaded data!   |
| Repeat Masking  | [Repeat masking - TSI]()                         | Repeat masking of reference genome  |   Reference genome  | FASTA file, Statistic file 
| RNA seq QC and trimming| [QC and trimming of RNAseq reads -TSI]()                         | Trimming of fastq files, including a fastqc step | Raw mRNA sequencing files  |   FASTQC report, Paired read FASTQ file  |
| Align  reads to find transcripts  | [Find transcripts - TSI]()                         | Alignment of trimmed FASTQ reads to masked reference genome | Repeat masked reference genome, paired trimmed FASTQ reads  |   BAM file, GTF file alignment metrics|
| Combine Transcripts  | [Combine Transcripts - TSI]()                         | Merges individual tissue transcripts to a global transcriptome and predicts coding sequences |GTF file, closely related species coding and non-coding sequences  |   GTF for global transcriptome, FASTA sequences of coding transcripts   |
| Extract Longest Transcripts  | [Extract Transcripts-TSI]()                         | Transdecoder predictions and filtering of transcripts | FASTA sequence of coding transcripts  |   pep.fasta, cds.fasta and gff3 file of longest isoform transcripts  |
| Convert Outputs  | [Convert formats - TSI]()                         | Converts outputs of transcdecoder to required inputs for FGenesH++ annotation  | transdecoder-peptides.fasta, global_nucleotides.fasta  |.cdna, .dat and .pro files  |


## In-depth workflow guide

### Register and login

1. To register for Galaxy Australia, visit the [login page](https://usegalaxy.org.au/login).
2. Click the ```Register here``` link, as shown in **Fig 2**.
3. Complete the registration wizard and click ```Create```.
4. Login to your account!

{Figure 2 caption="Fig 2. Log-in / registration menu for [Galaxy Australia](https://usegalaxy.org.au/)."}

### Upload data file(s)
1. In Galaxy Australia, create a new history and click on ```Upload Data```  and choose local files (See Figure 3)
2. Upload your assembled reference genome and raw mRNA transcriptome FASTQ files

### Run the Repeat Masking Workflow

1. Make sure you are logged into Galaxy Australia
2. Visit this link[Link to workflows]:
    
    Retrieve the workflows for Repeat Masking
    
    Import into your Galaxy Australia workflows
3. Once you have reached the workflow screen, select the ```play``` button for Repeat Masking (See Figure 4)
4. The workflow invoation window will open. Select your reference genome fasta file (Figure 5) and run workflow

### Run RNA seq QC and trimming workflow
1. Visit this link[Link to workflows]:
    
    Retrieve the workflows for QC and trimming of RNAseq reads
    
    Import into your Galaxy Australia workflows
2. If each tissue was sequences across multiple lanes, make two datasets, one containing forward reads and one containing reverse reads
3. Once you have reached the workflow screen, select the ```play``` button for QC and trimming of RNAseq reads (See Figure 6).
4. Select forward and reverse datasets and run workflow (Figure 7)
5. Check the MultiQC webpage for each trimmed collection and "#table-reads-info-after-trimming" files to quality check trimmed reads

### Run align reads to find transcripts workflow
1. Visit this link[Link to workflows]:
    
    Retrieve the workflows for Align reads to find transcripts
    
    Import into your Galaxy Australia workflows
2. Once you have reached the workflow screen, select the ```play``` button for Align reads to find transcripts (Fig 8)
3. Select the paired forward and paired reverse trimmed reads and masked reference genome as input (Fig9), ensure you select files tagged with #fastq_out_r1_paired and #fastq_out_r2_paired.
4. Check the mapping summary file for each tissue to make sure there are high mapping rates to the genome
5. Make a dataset collection containing gtf files for all tissue transcriptomes

### Run Combine Transcripts
1. Visit this link[Link to workflows]:
    
    Retrieve the workflows for Combine transcripts
    
    Import into your Galaxy Australia workflows
2. Once you have reached the workflow screen, select the ```play``` button for Combine Transcripts (Fig 10)
3. Search for your species on NCBI Taxonomy (https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi) to find the most closely related species which has an NCBI RefSeq annotation (Fig 11), go to the NCBI ftp server and locate the entry for this species (e.g. Corroborree frog RefSeq entry is GCF_028390025.1 and ftp entry is https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/028/390/025/). Download the _cds_from_genomic.fna.gz and pseudo_without_product.fna.gz files to your local computer and upload into Galaxy (Fig 12).
4. Select the gtf collection, masked reference genome, coding sequences and pseudo coding sequences in the combine transcripts workflow and Step 7 of the workflow ensure the masked genome is selected and in Step 10 of the workflow type "1" in the 'List of Fields' box (Fig 13; Fig 14; Fig 15)

### Run Extract Longest Transcripts workflow
1. Visit this link[Link to workflows]:
    
    Retrieve the workflows for Extract longest transcripts
    
    Import into your Galaxy Australia workflows
2. Once you have reached the workflow screen, select the ```play``` button for Extract longest transcript  (Fig 16)
3. Select the fasta output file from the previous workflow (tagged with #seqs-with-high-coding-prob) as input to the workflow (Fig 17). Also, in Step 4, select the most appropriate BUSCO lineage to run on the output file from Transdecoder.
4. Check the BUSCO output to ensure a high percentage of complete BUSCO's are found in the transcriptome

### Run Convert Outputs workflow
1. Visit this link[Link to workflows]:
    
    Retrieve the workflows for Convert outputs
    
    Import into your Galaxy Australia workflows
2. Once you have reached the workflow screen, select the ```play``` button for Covert outputs  (Fig 18).
3. Select the transdecoder peptide fasta file and the text transformed fasta output file from the Combine Transcripts workflow (Fig 19; Fig20).
4. The output files tagged with #dat, #pro and #cdna, along with the masked and unmasked reference genome are used as input files for FGenesH++ genome annotation (Link to Workflow).
