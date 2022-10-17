---
title: Genome assembly with hifiasm on Galaxy Australia
contributors: [Gareth Price, Jo Day, Johan Gustafsson, Kate Farquharson]
---

[Galaxy Australia](https://usegalaxy.org.au/) is capable of *de novo* assembling genomes based on PacBio high fidelity reads built from circular consensus sequence HiFi reads.

This How-to-Guide will describe the steps required to assemble your genome on the Galaxy Australia platform, using multiple workflows (see **Fig 1**) developed in consultations between the Bioplatforms Australia [Threatened Species Initiative](https://threatenedspeciesinitiative.com/), [Galaxy Australia](https://usegalaxy.org.au/), and the [Australian BioCommons](https://www.biocommons.org.au/).

{% include callout.html type="note" content="If you need help, the Galaxy community is both approachable and helpful. [Ask them questions!](https://help.galaxyproject.org/)" %}

## Quick start guide

1. [Login to Galaxy Australia](#register-and-login)
2. Create a new history
3. Upload your HiFi ```ccs.bam``` data files to your Galaxy history
4. Load and execute workflows (links included below), using required options
   - FILE CONVERSION workflow: [```BAM to FASTQ + QC```](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=220&trs_version=2) **optional**
   - ASSEMBLY workflow: [```PacBio HiFi genome assembly workflow```](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=221&trs_version=2)
   - PURGE DUPLICATES workflow: [```Purge duplicates from hifiasm assembly```](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=237&trs_version=2) **optional**

5. Review workflow report and perform additional QC as needed
6. Re-run workflows, or individual tools, as needed

## The overall workflow

{% include image.html file="hifi_assembly/overall_workflow.png" caption="Fig 1. The approach described in this How-to-Guide, including Quick Start guide steps 1) registration, 2) upload of input BAM file, 3) BAM to FASTQ conversion workflow, 4) assembly workflow, 5) purge duplicates workflow and 6) reviewing the assembly report and FASTA metrics. Required workflow steps are blue, and optional steps are red."%}

Further to this, a summary of the different elements of this assembly approach are detailed below:

| Process name     | Workflow name                             | Description                                                                          | Inputs                                                              | Outputs                                                                                                     |
| ---------------- | ----------------------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| UPLOAD FILES     | Not applicable                            | See the [different upload options](#upload-data-files).                                     | BAM (start at step 3 in Fig 1), or FASTQ (start at step 4 in Fig 1) | Uploaded data!                                                                                              |
| FILE CONVERSION  | [BAM to FASTQ + QC](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=220&trs_version=2)                         | Conversion of files from BAM to FASTQ, including a FASTQC quality control (QC) step. |                                                                     | FASTQ file, FASTQC report HTML file                                                                         |
| ASSEMBLY         | [PacBio HiFi genome assembly using hifiasm](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=221&trs_version=2) | Assembly using the hifiasm tool, including Bandage visualisation and QC.             |                                                                     | Assembly file in FASTA format, FASTA metrics, Assembly report file                                          |
| PURGE DUPLICATES | [Purge duplicates from hifiasm assembly](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=237&trs_version=2)    | Optional workflow to purge duplicates from the contig assembly.                      |                                                                     | Purged primary sequences from draft assembly (FASTA), Purged haplotig sequences from draft assembly (FASTA) |

The WorkflowHub entries are all available in [this collection](https://workflowhub.eu/collections/5).

## In-depth guide

### Register and login

1. To register for Galaxy Australia, visit the [login page](https://usegalaxy.org.au/login).
2. Click the ```Register here``` link, as shown in **Fig 2**.
3. Complete the registration wizard and click ```Create```.
4. Login to your account!

{% include image.html file="hifi_assembly/1_register.png" caption="Fig 2. Log-in / registration menu for [Galaxy Australia](https://usegalaxy.org.au/)."%}

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
     {% include image.html file="hifi_assembly/data_portal.png" inline=true caption="Fig 3. The appearance of a HiFi data set in the Bioplatforms Australia data portal browser interface."%}

2. Click ```Access``` and select ```Copy Download URL``` in the drop down menu (see **Fig. 3**).

    - **Note:** This will copy a download URL to your clipboard. 
    - **The URL is time sensitive and will expire after 10 minutes.** 
    - Please note you only need to instigate the download within this 10 minute window. The import itself can take longer than 10 minutes.

3. In Galaxy Australia, perform the steps outlined in **Fig. 4**
     - Step 1: Create a new history

   ![](../images/hifi_assembly/galaxy_history.png)

     - Step 2: Click on ```Upload Data```
     - Step 3: Select ```Paste/Fetch data```
     - Step 4: Paste the URL you obtained from the data portal into the content box.
     - Step 5: Select ```Start```

{% include image.html file="hifi_assembly/import_data.png" caption="Fig 4. Process required for download of data based on a URL provided to Galaxy Australia."%}

{% include callout.html type="note" content="you can paste multiple URLs in this box. If you have more than 1 SMRT cell of data, you will need to copy the URLs for each of the ccs.bam files and paste them in here." %}

### Other data transfer options are also available

#### Self-managed (download & upload)

- [Download](https://usersupport.bioplatforms.com/programmatic_access.html) required HiFi data to your personal computer, then
- Upload / transfer to Galaxy Australia (see **Fig 5**)
     - Note: the following Galaxy Training Network tutorial provides guidance on [how to upload files via URL](https://training.galaxyproject.org/training-material/topics/introduction/tutorials/galaxy-intro-short/tutorial.html#upload-a-file). The same mechanism can be used to upload local files, by selecting ```Choose local files``` (see **Fig 5**).

{% include image.html file="hifi_assembly/2_upload.png" caption="Fig 5. Choosing local files to upload to Galaxy Australia."%}

#### Self-managed (Cloudstor mediated)

- Upload / transfer data to Cloudstor (see [Getting Started Guide](https://support.aarnet.edu.au/hc/en-us/articles/227469547-CloudStor-Getting-Started-Guide)), then
- Upload / transfer to Galaxy Australia (see ```Import from CloudStor``` tool in Galaxy Australia)

#### Supported

- Contact the [Galaxy Australia Support team](mailto:help@genome.edu.au) for data chaperoning.

### OPTIONAL STEP: convert BAM files to FASTQ 

{% include callout.html type="important" content="please note the following important points"%} 
- **This workflow is not needed if files are already in FASTQ format**
- **You must do this step if your files are in ```ccs.bam``` format**
- **You will need to complete this workflow for each BAM file**

1. Make sure you are logged into Galaxy Australia
2. [Visit this link](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&trs_id=220&trs_version=2) to:
   - retrieve the workflow for file conversion, 
   - add it to your Galaxy Australia workflows list, and
   - open your workflows list (which can also be reached by clicking the ```Workflow``` tab, highlighted by a red box in **Fig 6**, in the Galaxy interface)

{% include image.html inline=true file="hifi_assembly/2_workflow_button.png" caption="Fig 6. The main page of the Galaxy Australia service."%}

{% include callout.html type="tip" content="**Did you know?** You can view the workflow diagram by clicking on the workflow name in the list and selecting ```Edit```." %}

3. Once you have reached the workflow screen, select the ```play``` button (highlighted by a red box in **Fig 7**) for the ```BAM to FASTQ + QC``` workflow.

{% include image.html inline=true file="hifi_assembly/3_workflow_screen.png" caption="Fig 7. The workflows page of the Galaxy Australia service is where your workflows appear. The blue box is a zoom view of the workflow table, and the ```play``` button to launch your workflow is highlighted by a red box."%}

4. The workflow invocation window will open. Select the BAM file that you previously loaded into your Galaxy history using the drop-down menu (step 1 in **Fig 8**). 
   
{% include callout.html type="warning" content="Depending on the contents of your BAM file, the parameters (options) chosen will impact the file produced." %}

{:start="5"}

5. Click ```Run workflow``` (step 2 in **Fig 8**).
     {% include image.html  inline=true file="hifi_assembly/4_run_wf_1.png" caption="Fig 8. The workflow invocation menu for the BAM to FASTQ + QC workflow. Step 1 is to select the BAM file for conversion using the drop-down menu, and Step 2 is to select Run workflow."%}

6. The workflow will produce
   - A ```FASTQ file``` that will be the input for the assembly workflow covered in the next section (**Fig 9a**), and
   - A ```FastQC report``` which you can view in the Galaxy user interface (**Fig 9b**).
	 
7. If you only have a single BAM file, stop here! If you have multiple BAM files, repeat this entire section of the tutorial for each BAM file:

{% include callout.html type="important" content="if you have multiple BAM files to convert, you will need to [join the multiple FASTQ files produced by the workflow](#joinfiles).
Another tool called ```Concatenate datasets tail-to-head``` (Galaxy Version 0.1.1) can be used for this purpose." %}

{% include callout.html type="tip" content="**Did you know?** You don’t need to re-run entire workflows! You can re-run individual tools in Galaxy Australia by selecting the previous tool run in your history and pushing the button indicated below." %}
 ![](../images/hifi_assembly/repeat_run.png)

{% include image.html file="hifi_assembly/fastq_stats.png" caption="Fig 9a. Example Fastq file output."%}

{% include image.html file="hifi_assembly/fastqc_report.png" caption="Fig 9b. Example FASTQC html report."%}

### OPTIONAL STEP: joining multiple FASTQ files (e.g. from multiple flow cells)

{% include callout.html type="note" content="If you need to concatenate multiple FASTQ files, for example from multiple flow cells, you can use the ```Concatenate datasets tail-to-head``` tool in Galaxy Australia (see below).
Note that you can insert multiple data sets (i.e. FASTQs), and should only concatenate files with identical formats.
" %}

1. Search for the ```Concatenate datasets tail-to-head``` tool in the Galaxy Australia browser interface (step 1 in **Fig 10**).
2. Select the tool from the search results (step 2 in **Fig 10**).
     {% include image.html inline=true file="hifi_assembly/fig10.png" caption="Fig 10. Search for and open a tool using the Galaxy Australia interface."%}

3. In the tool menu, select the first FASTQ data set (step 3 in **Fig 11**).
4. Insert additional FASTQ data sets by selecting the ```+ Insert Dataset``` button (step 4 in **Fig 11**).
5. When all data sets are selected, press ```Execute``` (step 5 in **Fig 11**).

{% include image.html file="hifi_assembly/fig11.png" caption="Fig 11. Select data sets and execute the Concatenate datasets tool."%}


### Assembly workflow

{% include callout.html type="important" content="This workflow includes an adapter filtering step that makes use of
[HiFiAdapterFilt](https://bio.tools/hifiadapterfilt). Adapter contamination in the reads could cause misassemblies, 
and will result in NCBI rejecting the upload of affected genome assemblies. `HiFiAdapterFilt` identifies `.ccs` 
reads containing adapter sequences using the same method as NCBI and removes the entire read prior to genome assembly 
to avoid such misassemblies." %}

1. Make sure you are logged into Galaxy Australia
2. [Visit this link](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&trs_id=221&trs_version=2) to:
   1. retrieve the assembly workflow, 
   2. add it to your Galaxy Australia workflows list, and
   3. open your workflows list (which can also be reached by clicking the ```Workflow``` tab [highlighted by a red box in **Fig 6**] in the Galaxy interface)
3. Select the play button (highlighted by a red box in **Fig 7**) for the ```PacBio HiFi genome assembly using hifiasm``` workflow (the workflow is shown in **Fig 12**).
     
{% include image.html inline=true file="hifi_assembly/6_run_wf_2.png" caption="Fig 12. PacBio HiFi genome assembly using hifiasm. The blue boxes indicate the main steps in the workflow, which produce the primary hifiasm assembly. The grey boxes indicate the other outputs of hifiasm, which are hidden but still accessible after the workflow has been run."%}

4. The workflow invocation window will open. 
5. Select the FASTQ file that was produced by the ```BAM to FASTQ + QC``` workflow using the drop-down menu.
6. Select correct workflow input parameters
7. Click the ```Run workflow``` button (as in step 2 of **Fig 8**).
8. The ```PacBio HiFi genome assembly using hifiasm``` workflow produces the following outputs (**Fig 13**):
   - Bandage info and images for:
        - Primary assembly contig graph
        - Alternate assembly contig graph
        - Processed unitig graph
        - Haplotype resolved raw unitig graph
   - FASTA file for the primary assembly contig GFA file
   - Fasta statistics for primary assembly contig FASTA file

{% include image.html file="hifi_assembly/bandage_info.png" caption="Fig 13a. Example Bandage info file for primary assembly contig graph."%}

{% include image.html file="hifi_assembly/bandage_image.png" caption="Fig 13b. Example Bandage image file for primary assembly contig graph."%}

{% include image.html file="hifi_assembly/fasta_statistics.png" caption="Fig 13c. Example Fasta statistics for primary assembly contig FASTA file."%}

{% include callout.html type="tip" content="**Did you know?**
You can access the other assembly output types for hifiasm (haplotype resolved, unitig graph and alternate assembly).
They are just hidden so that the workflow highlights the provision of the primary assembly contig graph.
For instructions on how to reveal hidden files, see [this link](#hiddenfiles).
" %}

### OPTIONAL STEP: Purge duplicates from hifiasm assembly

1. Make sure you are logged into Galaxy Australia
2. [Visit this link](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&trs_id=237&trs_version=2) to:
   1. retrieve the purge duplicates workflow, 
   2. add it to your Galaxy Australia workflows list, and
   3. open your workflows list (which can also be reached by clicking the ```Workflow``` tab [highlighted by a red box in **Fig 6**] in the Galaxy interface)
3. Select the play button (highlighted by a red box in **Fig 7**) for the ```Purge duplicates from hifiasm assembly``` workflow (the workflow is shown in **Fig 14**).
     
{% include image.html file="hifi_assembly/Purge_duplicates.png" caption="Fig 14. Purge duplicates from hifiasm assembly."%}

{:start="4"}
4. The workflow invocation window will open. 
5. Select the raw reads in FASTQ format, and hifiasm primary contig assembly file (FASTA format) using the drop-down menu.
     {% include callout.html type="note" content="These inputs are both produced by the ```PacBio HiFi genome assembly using hifiasm``` workflow." %}

{:start="6"}
6. Select correct workflow input parameters
7. Click the ```Run workflow``` button (as in step 2 of **Fig 8**).
8. The ```Purge duplicates from hifiasm assembly``` workflow produces the following outputs:
     - Purged primary sequences from draft assembly (FASTA)
     - Purged haplotig sequences from draft assembly (FASTA)

### Review Workflow Report

{% include callout.html type="note" content="A workflow report is generated automatically following completion of the workflow run (see **Fig 15**)." %}

1. Review quality control contents of the workflow report (**Fig 15**).
2. Inspect bandage image (**Fig 16**).
3. Review fasta statistics (**Fig 17**).

{% include image.html file="hifi_assembly/workflow_report.png" caption="Fig 15. Example workflow report."%}

{% include image.html file="hifi_assembly/primary_hifiasm_assembly.png" caption="Fig 16. Bandage image for the primary hifiasm assembly."%}

{% include image.html file="hifi_assembly/fasta_statistics_report.png" caption="Fig 17. Basic summary statistics are included in the fasta statistics output. This includes: `number of contigs (num_seq)`, `assembly size (num_bp)`, `contig N50 (len_N50)`, `L50`."%}


### OPTIONAL STEP: Post-assembly quality control workflow

{% include callout.html type="note" content="This workflow is still being developed." %}

## Appendices

### Revealing hidden files

{% include callout.html type="note" content="By default, the workflow hides 3 of the outputs of hifiasm. The only one that is visible is the primary assembly contig graph.
To reveal the hidden outputs, follow these steps:" %}

1. In your history panel, click on ```hidden files``` (as shown by the red box in **Fig S1**).
2. If you would like to unhide the data set, click on ```Unhide it``` in the expanded history panel that appears following step 1 (as shown by the red box in **Fig S2**).




