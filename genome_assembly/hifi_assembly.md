---
title: Genome assembly with hifiasm on Galaxy Australia
contributors: [Gareth Price, Jo Day, Johan Gustafsson, Kate Farquharson]
---

[Galaxy Australia](https://usegalaxy.org.au/) is capable of *de novo* assembling genomes based on PacBio high fidelity reads built from circular consensus sequence HiFi reads.

This How-to-Guide will describe the steps required to assemble your genome on the Galaxy Australia platform, using multiple workflows (see **Fig 1**) developed in consultations between the Bioplatforms Australia [Threatened Species Initiative](https://threatenedspeciesinitiative.com/), [Galaxy Australia](https://usegalaxy.org.au/), and the [Australian BioCommons](https://www.biocommons.org.au/).

---

{% include callout.html type="note" content="If you need help, the Galaxy community is both approachable and helpful. [Ask them questions!](https://help.galaxyproject.org/)" %}

---

## The overall workflow

![*Fig 1.* The approach described in this How-to-Guide, including Quick Start guide steps 1) registration, 2) upload of input BAM file, 3) BAM to FASTQ conversion workflow, 4) assembly workflow, 5) purge duplicates workflow and 6) reviewing the assembly report and FASTA metrics. Required workflow steps are blue, and optional steps are red.](./images/overall_workflow.png)


Further to this, a summary of the different elements of this assembly approach are detailed below:

| Process name     | Workflow name                             | Description                                                                          | Inputs                                                              | Outputs                                                                                                     |
| ---------------- | ----------------------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| UPLOAD FILES     | Not applicable                            | See the different upload options in section 5.2.                                     | BAM (start at step 3 in Fig 1), or FASTQ (start at step 4 in Fig 1) | Not applicable                                                                                              |
| FILE CONVERSION  | BAM to FASTQ + QC                         | Conversion of files from BAM to FASTQ, including a FASTQC quality control (QC) step. |                                                                     | FASTQ file, FASTQC report HTML file                                                                         |
| ASSEMBLY         | PacBio HiFi genome assembly using hifiasm | Assembly using the hifiasm tool, including Bandage visualisation and QC.             |                                                                     | Assembly file in FASTA format, FASTA metrics, Assembly report file                                          |
| PURGE DUPLICATES | Purge duplicates from hifiasm assembly    | Optional workflow to purge duplicates from the contig assembly.                      |                                                                     | Purged primary sequences from draft assembly (FASTA), Purged haplotig sequences from draft assembly (FASTA) |

- The WorkflowHub entries
     - File conversion: [BAM to FASTQ + QC](https://workflowhub.eu/workflows/220)
     - Assembly: [PacBio HiFi genome assembly using hifiasm](https://workflowhub.eu/workflows/221)
     - Purge duplicates: [Purge duplicates from hifiasm assembly](https://workflowhub.eu/workflows/237)

---

## Quick start guide

1. Login to Galaxy Australia
2. Create a new history
3. Upload your HiFi ```ccs.bam``` data files to your Galaxy history
4. Load and execute workflows (links included below), using required options

 - FILE CONVERSION workflow: [```BAM to FASTQ + QC```](https://usegalaxy.org.au/u/johan/w/bam-to-fastq-with-qc-for-hifiasm-shared-by-user-gareth-qfab) **optional**
 - ASSEMBLY workflow: [```PacBio HiFi genome assembly workflow```](https://usegalaxy.org.au/u/johan/w/hifiasm-shared-by-user-gareth-qfab)
 - PURGE DUPLICATES workflow: [```Purge duplicates from hifiasm assembly```](https://usegalaxy.org.au/u/johan/w/purge-duplicates-from-hifiasm-shared-by-user-gareth-qfab) **optional**

{:start="5"}
5. Review workflow report and perform additional QC as needed
6. Re-run workflows, or individual tools, as needed

---

## In-depth guide

### Register and login

1. To register for Galaxy Australia, visit the [login page](https://usegalaxy.org.au/login).
2. Click the ```Register here``` link, as shown in **Fig 2**.
3. Complete the registration wizard and click ```Create```.
4. Login to your account!

![](./images/1_register.png){: height="500px" width="500px"}

***Fig 2.** Log-in / registration menu for [Galaxy Australia](https://usegalaxy.org.au/).*

---

### Upload data file(s)

{% include callout.html type="note" content="**FAQ: can data be seamlessly transferred from 
the Data Portal to Galaxy Australia?**
The Australian BioCommons is working with the 
Bioplatforms Australia data portal team to develop 
a direct transfer mechanism from the portal to 
Galaxy Australia histories. This solution will be made 
available as soon as possible.
" %}
 
1. Select your data using the Bioplatforms Data Portal
     - The files you need for the assembly are ```.css.bam``` format
     - **Fig 3** shows a HiFi data set selected in the data portal browser interface.

 ![Fig 3. The appearance of a HiFi data set in the Bioplatforms Australia data portal browser interface.](./images/data_portal.png){: height="500px" width="500px"}

 

{:start="2"}
2. Click ```Access``` and select ```Copy Download URL``` in the drop down menu (see **Fig. 3**).

    - **Note:** This will copy a download URL to your clipboard. 
    - **The URL is time sensitive and will expire after 10 minutes.** 
    - Please note you only need to instigate the download within this 10 minute window. The import itself can take longer than 10 minutes.

{:start="3"}
3. In Galaxy Australia, perform the steps outlined in **Fig. 4**

     - Step 1: Click on ```Upload Data``` 
     - Step 2: Select ```Paste/Fetch data```
     - Step 3: Paste the URL you obtained from the data portal into the content box.
     - Step 4: Select ```Start```

![Fig 4. Process required for download of data based on a URL provided to Galaxy Australia.](./images/import_data.png){: height="500px" width="500px"}

{% include callout.html type="note" content="Note: you can paste multiple URLs in this box. If you have more than 1 SMRT cell of data, you will need to copy the URLs for each of the ccs.bam files and paste them in here." %}

---

### Other data transfer options are also available

#### Self-managed (download & upload)

- [Download](https://usersupport.bioplatforms.com/programmatic_access.html) required HiFi data to your personal computer, then
- Upload / transfer to Galaxy Australia (see **Fig 5**)
     - Note: the following Galaxy Training Network tutorial provides guidance on [how to upload files via URL](https://training.galaxyproject.org/training-material/topics/introduction/tutorials/galaxy-intro-short/tutorial.html#upload-a-file). The same mechanism can be used to upload local files, by selecting ```Choose local files``` (see **Fig 5**).

![Fig 5. Choosing local files to upload to Galaxy Australia.](./images/2_upload.png){: height="500px" width="500px"}

#### Self-managed (Cloudstor mediated)

- Upload / transfer data to Cloudstor (see [Getting Started Guide](https://support.aarnet.edu.au/hc/en-us/articles/227469547-CloudStor-Getting-Started-Guide)), then
- Upload / transfer to Galaxy Australia (see ```Import from CloudStor``` tool in Galaxy Australia)

#### Supported

- Contact the [Galaxy Australia Support team](mailto:help@genome.edu.au) for data chaperoning.

---

### OPTIONAL STEP: convert BAM files to FASTQ 

{% include callout.html type="note" content="You must do this step if your files are in ```ccs.bam``` format" %}

{% include callout.html type="note" content="This step is not needed if files are already in FASTQ format" %}

{% include callout.html type="note" content="You will need to complete this workflow for each BAM file" %}

1. Make sure you are logged into Galaxy Australia
2. [Visit this link](https://usegalaxy.org.au/u/johan/w/bam-to-fastq-with-qc-for-hifiasm-shared-by-user-gareth-qfab) and retrieve the workflow for file conversion by clicking the import workflow button at the top right
3. Navigate to your list of workflows by clicking on the ```Workflow``` tab (highlighted by a red box in **Fig 6**) in the Galaxy interface.

![Fig 6. The main page of the Galaxy Australia service.](./images/2_workflow_button.png)

{:start="4"}
4. Once you have reached the workflow screen, select the ```play``` button (highlighted by a red box in **Fig 7**) for the ```BAM to FASTQ + QC``` workflow.

![Fig 7. The workflows page of the Galaxy Australia service is where your workflows appear. The blue box is a zoom view of the workflow table, and the ```play``` button to launch your workflow is highlighted by a red box.](./images/3_workflow_screen.png)

{:start="5"}
5. The workflow invocation window will open. Select the BAM file that you previously loaded into your Galaxy history using the drop-down menu (step 1 in **Fig 8**). **WARNING:** depending on the contents of your BAM file, the parameters (options) chosen will impact the file produced.
6. Click ```Run workflow``` (step 2 in **Fig 8**).

![Fig 8. The workflow invocation menu for the BAM to FASTQ + QC workflow. Step 1 is to select the BAM file for conversion using the drop-down menu, and Step 2 is to select Run workflow.](./images/4_run_wf_1.png)

{:start="7"}
7. The workflow will produce

- A ```FASTQ file``` that will be the input for the assembly workflow covered in the next section (**Fig 9a**), and
- A ```FastQC report``` which you can view in the Galaxy user interface (**Fig 9b**).

{:start="8"}	 
8. If you only have a single BAM file, stop here! If you have multiple BAM files, repeat this entire section of the tutorial for each BAM file:

{% include callout.html type="important" content="**Don’t forget:** you will then need to [join the multiple FASTQ files together](#joinfiles).
Another tool called ```Concatenate datasets tail-to-head``` (Galaxy Version 0.1.1) can be used for this purpose." %}

{% include callout.html type="note" content="**Did you know?**
You can view the workflow diagram by clicking on the 
workflow name in the list and selecting ```Edit```." %}

{% include callout.html type="note" content="**Did you know?**
You don’t need to re-run entire workflows!
You can re-run individual tools in Galaxy Australia by selecting the previous tool run in your history and pushing the button indicated below." %}

![Fig 9a. Example Fastq file output.](./images/fastq_stats.png)

![Fig 9b. Example FASTQC html report.](./images/fastqc_report.png)

![](./images/repeat_run.png)

---

### Assembly workflow

1. Make sure you are logged into Galaxy Australia
2. [Visit this link](https://usegalaxy.org.au/u/johan/w/hifiasm-shared-by-user-gareth-qfab) and retrieve the assembly workflow by clicking the import workflow button at the top right
3. Navigate back to your list of workflows by clicking on the ```Workflow``` tab in the Galaxy interface (highlighted by a red box in **Fig 6**) 
4. Once you have reached the workflow screen, select the play button (highlighted by a red box in **Fig 7**) for the ```PacBio HiFi genome assembly using hifiasm``` workflow (the workflow is shown in **Fig 10**).

![Fig 10. PacBio HiFi genome assembly using hifiasm. The blue boxes indicate the main steps in the workflow, which produce the primary hifiasm assembly. The grey boxes indicate the other outputs of hifiasm, which are hidden but still accessible after the workflow has been run.](./images/6_run_wf_2.png){: height="500px" width="500px"}

{:start="5"}
5. The workflow invocation window will open. 
6. Select the FASTQ file that was produced by the ```BAM to FASTQ + QC``` workflow using the drop-down menu.
7. Select correct workflow input parameters
8. Click the ```Run workflow``` button (as in step 2 of **Fig 8**).
9. The ```PacBio HiFi genome assembly using hifiasm``` workflow produces the following outputs (**Fig 11**):
     - Bandage info and images for:
     - Primary assembly contig graph
     - Alternate assembly contig graph
     - Processed unitig graph
     - Haplotype resolved raw unitig graph
     - FASTA file for the primary assembly contig GFA file
     - Fasta statistics for primary assembly contig FASTA file

![Fig 11a. Example Bandage info file for primary assembly contig graph.](./images/bandage_info.png)

![Fig 11b. Example Bandage image file for primary assembly contig graph.](./images/bandage_image.png)

![Fig 11c. Example Fasta statistics for primary assembly contig FASTA file.](./images/fasta_statistics.png)

{% include callout.html type="tip" content="**Did you know?**
You can access the other assembly output types for hifiasm (haplotype resolved, unitig graph and alternate assembly).
They are just hidden so that the workflow highlights the provision of the primary assembly contig graph.
For instructions on how to reveal hidden files, see [this link](#hiddenfiles).
" %}

---

### OPTIONAL STEP: Purge duplicates from hifiasm assembly

1. Make sure you are logged into Galaxy Australia
2. [Visit this link](https://usegalaxy.org.au/u/johan/w/purge-duplicates-from-hifiasm-shared-by-user-gareth-qfab) and retrieve the workflow for purge duplicates by clicking the import workflow button at the top right
3. Navigate back to your list of workflows by clicking on the ```Workflow``` tab in the Galaxy interface (highlighted by a red box in **Fig 6**) 
4. Once you have reached the workflow screen, select the play button (highlighted by a red box in **Fig 7**) for the ```Purge duplicates from hifiasm assembly``` workflow (the workflow is shown in **Fig 12**).

![Fig 12. Purge duplicates from hifiasm assembly.](./images/Purge_duplicates.png)

{:start="5"}
5. The workflow invocation window will open. 
6. Select the raw reads in FASTQ format, and hifiasm primary contig assembly file (FASTA format) using the drop-down menu.

{% include callout.html type="note" content="These inputs are both produced by the ```PacBio HiFi genome assembly using hifiasm``` workflow." %}

{:start="7"}
7. Select correct workflow input parameters
8. Click the ```Run workflow``` button (as in step 2 of **Fig 8**).
9. The ```Purge duplicates from hifiasm assembly``` workflow produces the following outputs:
     - Purged primary sequences from draft assembly (FASTA)
     - Purged haplotig sequences from draft assembly (FASTA)

---

### Review Workflow Report

{% include callout.html type="note" content="A workflow report is generated automatically following completion of the workflow run (see **Fig 13**)." %}

1. Review quality control contents of the workflow report.

![Fig 13. Example workflow report.](./images/workflow_report.png)

{:start="2"}
2. Inspect bandage image (**Fig 14**).

![Fig 14. Bandage image for the primary hifiasm assembly.](./images/primary_hifiasm_assembly.png)

{:start="3"}
3. Review fasta statistics (**Fig 15**).

![Fig 15. Basic summary statistics are included in the fasta statistics output. This includes: `number of contigs (num_seq)`, `assembly size (num_bp)`, `contig N50 (len_N50)`, `L50`.](./images/fasta_statistics_report.png)

---

### OPTIONAL STEP: Post-assembly quality control workflow

{% include callout.html type="note" content="Note: This workflow is still being developed." %}

---

## Appendices

### Revealing hidden files

> By default, the workflow hides 3 of the outputs of hifiasm. The only one that is visible is the primary assembly contig graph.
To reveal the hidden outputs, follow these steps:

1. In your history panel, click on ```hidden files``` (as shown by the red box in **Fig S1**).
2. If you would like to unhide the data set, click on ```Unhide it``` in the expanded history panel that appears following step 1 (as shown by the red box in **Fig S2**).

---

### Joining multiple FASTQ files (e.g from multiple flow cells)

> If you need to concatenate multiple FASTQ files, for example from multiple flow cells, you can use the ```Concatenate datasets tail-to-head``` tool in Galaxy Australia (see below).
Note that you can insert multiple data sets (i.e. FASTQs), and should only concatenate files with identical formats.

1. Search for the ```Concatenate datasets tail-to-head``` tool in the Galaxy Australia browser interface (step 1 in **Fig S3**).
2. Select the tool from the search results (step 2 in **Fig S3**).

![Fig S3. Search for and open a tool using the Galaxy Australia interface.](./images/figS3.png){: height="200px" width="200px"}

{:start="3"}
3. In the tool menu, select the first FASTQ data set (step 3 in **Fig S4**).
4. Insert additional FASTQ data sets by selecting the ```+ Insert Dataset``` button (step 4 in **Fig S4**).
5. When all data sets are selected, press ```Execute``` (step 5 in **Fig S4**).

![Fig S4. Select data sets and execute the Concatenate datasets tool.](./images/figS4.png){: height="500px" width="500px"}

---

