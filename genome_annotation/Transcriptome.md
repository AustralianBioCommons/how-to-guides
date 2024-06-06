---
title: Transcriptome Alignment
type: genome-annotation
contributors: [Luke Silver, Anna Syme]
description: How-to Guide for Transcriptome alignment.
affiliations: [University of Sydney, Australian BioCommons, Threatened Species Initiative]
---

[Galaxy Australia](https://usegalaxy.org.au/) is capable of performing genome repeat masking and transcriptome alignment with stringtie and transdecoder

This How-to-Guide will describe the steps required to repeat your genome and align transcripts on the Galaxy Australia platform (see **Fig 1**), developed in consultations between the Bioplatforms Australia [Threatened Species Initiative](https://threatenedspeciesinitiative.com/), [Galaxy Australia](https://usegalaxy.org.au/), and the [Australian BioCommons](https://www.biocommons.org.au/).

If you need help, the Galaxy community is both approachable and helpful. [Ask them questions!](https://help.galaxyproject.org/)


## Quick start guide

1. [Login to Galaxy Australia](#register-and-login)
2. Create a new history
3. Upload your assembled reference genome and raw RNA sequencing reads (can be imported from [Bioplatforms Australia Portal](https://data.bioplatforms.com/about))
4. Load and execute workflows, using required options
  - [Open `Repeat masking` workflow](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=875)
  - [Open `RNA seq QC and read trimming` workflow](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=876)
  - [Open `Align reads to find transcripts` workflow](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=877)
  - [Open `Combine transcripts` workflow](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=878)
  - [Open `Extract longest transcripts` workflow](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=879)
  - [Open `Convert outputs` workflow](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=880)
5. Review workflow report and perform additional QC as needed
6. Re-run workflows, or individual tools, as needed


## How to cite the workflows

> Silver, L., & Syme, A. (2024). Repeat masking - TSI. WorkflowHub. https://doi.org/10.48546/WORKFLOWHUB.WORKFLOW.875.2

> Silver, L., & Syme, A. (2024). QC and trimming of RNAseq reads - TSI. WorkflowHub. https://doi.org/10.48546/WORKFLOWHUB.WORKFLOW.876.1

> Silver, L., & Syme, A. (2024). Find transcripts - TSI. WorkflowHub. https://doi.org/10.48546/WORKFLOWHUB.WORKFLOW.877.1

> Silver, L., & Syme, A. (2024). Combine transcripts - TSI. WorkflowHub. https://doi.org/10.48546/WORKFLOWHUB.WORKFLOW.878.1

> Silver, L., & Syme, A. (2024). Extract transcripts - TSI. WorkflowHub. https://doi.org/10.48546/WORKFLOWHUB.WORKFLOW.879.1

> Silver, L., & Syme, A. (2024). Convert formats - TSI. WorkflowHub. https://doi.org/10.48546/WORKFLOWHUB.WORKFLOW.880.1


## The overall workflow

{% include image.html file="/transcriptome/Fig1.PNG" caption="Fig 1. The overall transcriptome alignment workflow." max-width="10" %}

Further to this, a summary of the different elements of this alignment approach are detailed below:

| Process name     | Workflow name                             | Description                                                                          | Inputs                                                              | Outputs                                                                                                     |
| ---------------- | ----------------------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| UPLOAD FILES     | Not applicable                            | See the [different upload options](#upload-data-files).                                     |  reference genome, Fastq mRNA | Uploaded data!   |
| Repeat Masking  | [Repeat masking - TSI](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=875)                         | Repeat masking of reference genome  |   Reference genome  | FASTA file, Statistic file 
| RNA seq QC and trimming| [QC and trimming of RNAseq reads -TSI](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=876)                         | Trimming of fastq files, including a fastqc step | Raw mRNA sequencing files  |   FASTQC report, Paired read FASTQ file  |
| Align  reads to find transcripts  | [Find transcripts - TSI](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=877)                         | Alignment of trimmed FASTQ reads to masked reference genome | Repeat masked reference genome, paired trimmed FASTQ reads  |   BAM file, GTF file alignment metrics|
| Combine Transcripts  | [Combine Transcripts - TSI](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=878)                         | Merges individual tissue transcripts to a global transcriptome and predicts coding sequences |GTF file, closely related species coding and non-coding sequences  |   GTF for global transcriptome, FASTA sequences of coding transcripts   |
| Extract Longest Transcripts  | [Extract Transcripts-TSI](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=879)                         | Transdecoder predictions and filtering of transcripts | FASTA sequence of coding transcripts  |   pep.fasta, cds.fasta and gff3 file of longest isoform transcripts  |
| Convert Outputs  | [Convert formats - TSI](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=880)                         | Converts outputs of transcdecoder to required inputs for FGenesH++ annotation  | transdecoder-peptides.fasta, global_nucleotides.fasta  |.cdna, .dat and .pro files  |


## In-depth workflow guide

### Register and login

1. To register for Galaxy Australia, visit the [login page](https://usegalaxy.org.au/login).
2. Click the ```Register here``` link, as shown in **Fig 2**.
3. Complete the registration wizard and click ```Create```.
4. Login to your account!

{% include image.html file="/genome_annotation/Fig2.png" caption="Fig 2. Log-in / registration menu for [Galaxy Australia](https://usegalaxy.org.au/)." max-width="10" %}


### Upload data file(s)

1. In Galaxy Australia, create a new history and click on ```Upload Data```  and choose local files (See Figure 3)
2. Upload your assembled reference genome and raw mRNA transcriptome FASTQ files

{% include image.html file="/transcriptome/Fig3.png" caption="Fig 3." max-width="10" %}


### Run the Repeat Masking Workflow

1. Make sure you are logged into Galaxy Australia
2. [Visit this link](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=875) to:
   - Retrieve the workflows for `Repeat Masking`
   - Import into your Galaxy Australia workflows
3. Once you have reached the workflow screen, select the ```play``` button for Repeat Masking (See Figure 4)
4. The workflow invoation window will open. Select your reference genome fasta file (Figure 5) and run workflow

{% include image.html file="/transcriptome/Fig4.png" caption="Fig 4." max-width="10" %}

{% include image.html file="/transcriptome/Fig5.png" caption="Fig 5." max-width="10" %}


### Run RNA seq QC and trimming workflow

1. [Visit this link](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=876) to:
   - Retrieve the workflows for `QC and trimming of RNAseq reads`
   - Import into your Galaxy Australia workflows
2. If each tissue was sequences across multiple lanes, make two datasets, one containing forward reads and one containing reverse reads
3. Once you have reached the workflow screen, select the ```play``` button for QC and trimming of RNAseq reads (See Figure 6).
4. Select forward and reverse datasets and run workflow (Figure 7)
5. Check the MultiQC webpage for each trimmed collection and "#table-reads-info-after-trimming" files to quality check trimmed reads

{% include image.html file="/transcriptome/Fig6.png" caption="Fig 6." max-width="10" %}

{% include image.html file="/transcriptome/Fig7.png" caption="Fig 7." max-width="10" %}


### Run align reads to find transcripts workflow

1. [Visit this link](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=877) to:
   - Retrieve the workflows for `Align reads to find transcripts` 
   - Import into your Galaxy Australia workflows
2. Once you have reached the workflow screen, select the ```play``` button for Align reads to find transcripts (Fig 8)
3. Select the paired forward and paired reverse trimmed reads and masked reference genome as input (Fig9), ensure you select files tagged with `#fastq_out_r1_paired` and `#fastq_out_r2_paired`
4. Check the mapping summary file for each tissue to make sure there are high mapping rates to the genome
5. Make a dataset collection containing gtf files for all tissue transcriptomes

{% include image.html file="/transcriptome/Fig8.png" caption="Fig 8." max-width="10" %}

{% include image.html file="/transcriptome/Fig9.png" caption="Fig 9." max-width="10" %}


### Run Combine Transcripts

1. [Visit this link](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=878) to:
   - Retrieve the workflow for `Combine transcripts`
   - Import into your Galaxy Australia workflows
2. Once you have reached the workflow screen, select the ```play``` button for Combine Transcripts (Fig 10)

{% include image.html file="/transcriptome/Fig10.png" caption="Fig 10." max-width="10" %}

{:start="3"}

3. Search for your species on [NCBI Taxonomy](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi) to find the most closely related species which has an NCBI RefSeq annotation (Fig 11)
4. Go to the NCBI ftp server and locate the entry for this species (e.g. Corroborree frog RefSeq entry is GCF_028390025.1 and ftp entry is https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/028/390/025/)
5. Download the `_cds_from_genomic.fna.gz` and `pseudo_without_product.fna.gz` files to your local computer and upload into Galaxy (Fig 12)

{% include image.html file="/transcriptome/Fig12.png" caption="Fig 12." max-width="10" %}

{:start="6"}

6. Select the gtf collection, masked reference genome, coding sequences and pseudo coding sequences in the combine transcripts workflow
7. In Step 7 of the workflow ensure the masked genome is selected and that in Step 10 of the workflow type "1" in the `List of Fields` box (Fig 13; Fig 14; Fig 15)

{% include image.html file="/transcriptome/Fig13.png" caption="Fig 13." max-width="10" %}

{% include image.html file="/transcriptome/Fig14.png" caption="Fig 14." max-width="10" %}

{% include image.html file="/transcriptome/Fig15.png" caption="Fig 15." max-width="10" %}


### Run Extract Longest Transcripts workflow

1. [Visit this link](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=879) to:
   - Retrieve the workflows for `Extract longest transcripts`
   - Import into your Galaxy Australia workflows
2. Once you have reached the workflow screen, select the ```play``` button for `Extract longest transcript`  (Fig 16)

{% include image.html file="/transcriptome/Fig16.png" caption="Fig 16." max-width="10" %}

{:start="3"}

3. Select the fasta output file from the previous workflow (tagged with #seqs-with-high-coding-prob) as input to the workflow (Fig 17)

{% include image.html file="/transcriptome/Fig17.png" caption="Fig 17." max-width="10" %}

{:start="4"}

4. Also, in workflow step 4, select the most appropriate BUSCO lineage to run on the output file from Transdecoder 
5. Check the BUSCO output to ensure a high percentage of complete BUSCO's are found in the transcriptome


### Run Convert Outputs workflow

1. [Visit this link](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=880) to:
   - Retrieve the workflows for `Convert outputs` 
   - Import into your Galaxy Australia workflows
2. Once you have reached the workflow screen, select the ```play``` button for Covert outputs  (Fig 18)

{% include image.html file="/transcriptome/Fig18.png" caption="Fig 18." max-width="10" %}

{:start="3"}

3. Select the transdecoder peptide fasta file and the text transformed fasta output file from the Combine Transcripts workflow (Fig 19; Fig20)

{% include image.html file="/transcriptome/Fig19.png" caption="Fig 19." max-width="10" %}

{% include image.html file="/transcriptome/Fig20.png" caption="Fig 20." max-width="10" %}

{:start="4"}

4. The output files tagged with `#dat`, `#pro`, and `#cdna`, along with the masked and unmasked reference genome are used as input files for [FGenesH++ genome annotation](Fgenesh)

