---
title: Genome Annotation with FgenesH++
type: genome-annotation
contributors: [Luke Silver, Anna Syme, Mike Thang, Tiff Nelson]
description: How-to Guide for genome annotation with FgenesH++.
affiliations: [University of Sydney, Australian BioCommons, Bioplatforms Australia, Galaxy Australia, Threatened Species Initiative]
---

[Galaxy Australia](https://usegalaxy.org.au/) is capable of conducting genome annotation using the FgenesH++ annotation tool. Users need to apply for access to this tool, please see [service notes here](https://www.biocommons.org.au/fgenesh-plus-plus) and apply for access [here](https://site.usegalaxy.org.au/request/access/fgenesh).

This How-to-Guide will describe the steps required to annotate your genome on the Galaxy Australia platform (see **Fig 1**), developed in consultations between the Bioplatforms Australia [Threatened Species Initiative](https://threatenedspeciesinitiative.com/), [Galaxy Australia](https://usegalaxy.org.au/), and [Australian BioCommons](https://www.biocommons.org.au/).

If you need help, the Galaxy community is both approachable and helpful. [Ask them questions!](https://help.galaxyproject.org/)


## Quick start guide

1. [Log in to Galaxy Australia](#register-and-login)
2. [Apply for access to FGenesH++](https://site.usegalaxy.org.au/request/access/fgenesh).
3. Create a new history
4. Upload your `assembled reference genome`, `repeat masked reference genome`, `.cdna`, `.pro` and `.dat` files from the [transcriptome workflow](Transcriptome)
5. Load and execute workflows, using required options
   - [Open `FgenesH++ genome annotation` workflow](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=881)
6. Review workflow report and perform additional QC as needed
7. Re-run workflows, or individual tools, as needed


## How to cite the workflow

> Silver, L. (2024). Fgenesh annotation -TSI. WorkflowHub. https://doi.org/10.48546/WORKFLOWHUB.WORKFLOW.881.5 


## The overall workflow

{% include image.html file="/genome_annotation/Fig1-updated2.png" caption="Fig 1. Genome annotation workflow diagram." max-width="10" %}

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

3. Upload your assembled reference genome and masked reference genome (Link to repeat masking workflow), as well as the `.cdna`, `.pro` and `.dat` output from your [transcriptome assembly](Transcriptome). Note: it is recommended by Softberry that the genome is hard-masked rather than soft-masked. 


### Run the annotation workflow

1. Make sure you are logged into Galaxy Australia
2. [Visit this link](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=881) to:
    - retrieve the workflow for genome annotation, and
    - import into your Galaxy Australia workflows
3. Once you have reached the workflow screen, select the ```play``` button for the annotation workflow (See Figure 4)

{% include image.html file="/genome_annotation/Fig4.png" caption="Fig 4." max-width="10" %}

{:start="4"}

4. The workflow invocation window will open.

5. Select your reference assembled genome fasta file.

6. Select your (hard) repeat-masked reference genome fasta file.

7. Select the matrix of an approximately closely-related species ([full list of matrices](http://www.softberry.com/berry.phtml?topic=org_list&group=programs&subgroup=gfind)).
8. Select "mammal" or "non-mammal" database.
9. Select a lineage that BUSCO will use on the output protein file.
10. For "Select nr db type", note that this only applies if you are using a set of known protein sequences, and have selected the option further down: USE_PROTEINS = yes. In this case, select the appropriate NR database (e.g. TSI animals). If you aren't using proteins, disregard this and leave as default setting.
11. Select the correct inputs for cDNA, protein and dat files. 
12. Click "Run Workflow".

