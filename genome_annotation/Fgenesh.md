---
title: Genome Annotation
type: genome-annotation
contributors: [Luke Silver, Anna Syme, Mike Thang, Tiff Nelson]
description: How-to Guide for genome annotation with FgenesH++.
affiliations: [University of Sydney, Australian BioCommons, Bioplatforms Australia, Galaxy Australia, Threatened Species Initiative]
---

[Galaxy Australia](https://usegalaxy.org.au/) is capable of conducting genome annotation using the FgenesH++ annotation tool.

This How-to-Guide will describe the steps required to annotate your genome on the Galaxy Australia platform (see **Fig 1**), developed in consultations between the Bioplatforms Australia [Threatened Species Initiative](https://threatenedspeciesinitiative.com/), [Galaxy Australia](https://usegalaxy.org.au/), and the [Australian BioCommons](https://www.biocommons.org.au/).

If you need help, the Galaxy community is both approachable and helpful. [Ask them questions!](https://help.galaxyproject.org/)


## Quick start guide

1. [Login to Galaxy Australia](#register-and-login)
2. Create a new history
3. Upload your `assembled reference genome`, `repeat masked reference genome`, `.cdna`, `.pro` and `.dat` files from the [transcriptome workflow](Transcriptome)
4. Load and execute workflows, using required options
   - [Open `FgenesH++ genome annotation` workflow](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=881)
5. Review workflow report and perform additional QC as needed
6. Re-run workflows, or individual tools, as needed


## How to cite the workflow

> Silver, L. (2024). Fgenesh annotation -TSI. WorkflowHub. https://doi.org/10.48546/WORKFLOWHUB.WORKFLOW.881.3 


## The overall workflow

{% include image.html file="/genome_annotation/Fig1.png" caption="Fig 1. The approach described in this How-to-Guide, including Quick Start guide steps 1) registration, 2) upload of input files, 3) FgenesH++ genome annotation Required workflow steps are blue, and optional steps are red." max-width="10" %}

Further to this, a summary of the different elements of this assembly approach are detailed below:

| Process name     | Workflow name                             | Description                                                                          | Inputs                                                              | Outputs                                                                                                     |
| ---------------- | ----------------------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| UPLOAD FILES     | Not applicable                            | See the [different upload options](#upload-data-files).                                     |  reference genome, repeat masked reference genome, `.cdna`, `.pro` and `.dat` files from transcriptome assembly workflow | Uploaded data!   |
| GENOME ANNOTATION  | [Fgenesh annotation-TSI](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=881)                         | Splitting of reference and masked reference genome files, annotation of genome using FgenesH++, merging of annotation files and extraction of mRNA, CDS and protein sequences | reference genome, repeat masked reference genome, `.cdna`, `.pro` and `.dat` files from transcriptome assembly workflow  |   GFF3 of annotated genes, fasta file of mRNA, CDS and protein sequences which were annotated  | 


## In-depth workflow guide


### Register and login

1. To register for Galaxy Australia, visit the [login page](https://usegalaxy.org.au/login).
2. Click the ```Register here``` link, as shown in **Fig 2**.
3. Complete the registration wizard and click ```Create```.
4. Login to your account!

{% include image.html file="/genome_annotation/Fig2.png" caption="Fig 2. Log-in / registration menu for [Galaxy Australia](https://usegalaxy.org.au/)." max-width="10" %}


### Upload data file(s)

1. In Galaxy Australia, create a new history and click on ```Upload Data```
2. Choose local files (see Figure 3)

{% include image.html file="/genome_annotation/Fig3.png" caption="Fig 3." max-width="10" %}

{:start="3"}

3. Upload your assembled reference genome and masked reference genome (Link to repeat masking workflow), as well as the `.cdna`, `.pro` and `.dat` output from your [transcriptome assembly](Transcriptome)


### Run the annotation workflow

1. Make sure you are logged into Galaxy Australia
2. [Visit this link](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=881) to:
    - retrieve the workflow for genome annotation, and
    - import into your Galaxy Australia workflows
3. Once you have reached the workflow screen, select the ```play``` button for the annotation workflow (See Figure 4)

{% include image.html file="/genome_annotation/Fig4.png" caption="Fig 4." max-width="10" %}

{:start="4"}

4. The workflow invocation window will open. 
5. Select your reference genome fasta file (Step 1 in Fig 5),
6. Select your repeat masked reference genome fasta file (Step 2 in Fig 5).

{% include image.html file="/genome_annotation/Fig5.png" caption="Fig 5." max-width="10" %}

{:start="7"}

7. Select the matrix of a closely related species ([full list of matrices](http://www.softberry.com/berry.phtml?topic=org_list&group=programs&subgroup=gfind)) (Step 1 in Fig 6), 
8. Select the appropriate reference database (Step 2 in Fig 6), 
9. Select the appropriate NR database (TSI animals or TSI plants) (Step 3 in Fig 6). 

{% include image.html file="/genome_annotation/Fig6.png" caption="Fig 6." max-width="10" %}

{:start="10"}

10. Select your `cDNA` (Step 1 in Fig 7), `protein` (Step 2 in Fig 7) and `Dat` files (Step 3 in Fig 7).

{% include image.html file="/genome_annotation/Fig7.png" caption="Fig 7." max-width="10" %}

{:start="11"}

11. Choose your reference genome as the sequence file for task 6 and 7 (Step 1 and 2 in Fig 8)
12. Choose the most appropriate lineage to run BUSCO on the protein output file (Step 1 in Fig 9)

{% include image.html file="/genome_annotation/Fig8.png" caption="Fig 8." max-width="10" %}

{% include image.html file="/genome_annotation/Fig9.png" caption="Fig 9." max-width="10" %}
