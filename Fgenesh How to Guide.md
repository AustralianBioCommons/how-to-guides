---
title: Genome Annotation
type: genome-annotation
contributors: [Luke Silver, Anna Syme, Mike Thang, Tiff Nelson]
description: How-to Guide for Genome Annotation with FgenesH++.
affiliation: [The University of Sydney, BioCommons Australia, Bioplatforms Australia, Galaxy Australia]
---

[Galaxy Australia](https://usegalaxy.org.au/) is capable of conducting genome annotation using the FgenesH++ annotation tool

This How-to-Guide will describe the steps required to annotate your genome on the Galaxy Australia platform (see **Fig 1**), developed in consultations between the Bioplatforms Australia [Threatened Species Initiative](https://threatenedspeciesinitiative.com/), [Galaxy Australia](https://usegalaxy.org.au/), and the [Australian BioCommons](https://www.biocommons.org.au/).

If you need help, the Galaxy community is both approachable and helpful. [Ask them questions!](https://help.galaxyproject.org/)

## Quick start guide

1. [Login to Galaxy Australia](#register-and-login)
2. Create a new history
3. Upload your assembled reference genome, repeat masked reference genome, .cdna, .pro and .dat files from transcriptome assembly workflow
4. Load and execute workflows, using required options
  - FgenesH++ genome annotation: [```Fgenesh annotation-TSI```]()

5. Review workflow report and perform additional QC as needed
6. Re-run workflows, or individual tools, as needed

## How to cite the workflows

## The overall workflow
{Figure 1 caption="Fig 1. The approach described in this How-to-Guide, including Quick Start guide steps 1) registration, 2) upload of input files, 3) FgenesH++ genome annotation Required workflow steps are blue, and optional steps are red."}

Further to this, a summary of the different elements of this assembly approach are detailed below:

| Process name     | Workflow name                             | Description                                                                          | Inputs                                                              | Outputs                                                                                                     |
| ---------------- | ----------------------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| UPLOAD FILES     | Not applicable                            | See the [different upload options](#upload-data-files).                                     |  reference genome, repeat masked reference genome, .cdna, .pro and .dat files from transcriptome assembly workflow | Uploaded data!   |
| GENOME ANNOTATION  | [Fgenesh annotation-TSI]()                         | Splitting of reference and masked reference genome files, annotation of genome using FgenesH++, merging of annotation files and extraction of mRNA, CDS and protein sequences | reference genome, repeat masked reference genome, .cdna, .pro and .dat files from transcriptome assembly workflow  |   GFF3 of annotated genes, fasta file of mRNA, CDS and protein sequences which were annotated  | 


## In-depth workflow guide

### Register and login

1. To register for Galaxy Australia, visit the [login page](https://usegalaxy.org.au/login).
2. Click the ```Register here``` link, as shown in **Fig 2**.
3. Complete the registration wizard and click ```Create```.
4. Login to your account!

{Figure 2 caption="Fig 2. Log-in / registration menu for [Galaxy Australia](https://usegalaxy.org.au/)."%}

### Upload data file(s)
1. In Galaxy Australia, create a new history and click on ```Upload Data```  and choose local files (See Figure 3)
2. Upload your assembled reference genome and masked reference genome (Link to repeat masking workflow), as well as the .cdna, .pro and .dat output from your transcriptome assembly (Link to transcriptome guide)

### Run the annotation workflow

1. Make sure you are logged into Galaxy Australia
2. Visit this link[Link to workflow]:
    retrieve the workflow for genome annotation
    import into your Galaxy Australia workflows
3. Once you have reached the workflow screen, select the ```play``` button for the annotation workflow (See Figure 4)
4. The workflow invoation window will open. Select your reference genome fasta file (Step 1 in Fig 5), select your repeat masked reference genome fasta file (Step 2 in Fig 5). Select the matrix of a closely related species (Full list of matricies see: http://www.softberry.com/berry.phtml?topic=org_list&group=programs&subgroup=gfind) (Step 1 in Fig 6), Select the appropriate reference database (Step 2 in Fig 6), select the appropriate NR database (TSI animals or TSI plants) (Step 3 in Fig 6). Select your cDNA (Step 1 in Fig 7), protein (Step 2 in Fig 7) and Dat files (Step 3 in Fig 7).
5. Choose your reference genome as the sequence file for task 6 and 7 (Step 1 and 2 in Fig 8)
6. Choose the most appropriate lineage to run BUSCO on the protein output file (Step 1 in Fig 9)

