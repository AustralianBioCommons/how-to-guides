---
title: Genome scaffolding with Hi-C on Galaxy Australia
type: genome-scaffolding
contributors: [VGP Project, Luke Silver, Anna Syme]
description: This guide describes the steps required to scaffold your genome on the Galaxy Australia platform using HiC data
affiliations: [Bioplatforms Australia, Galaxy Australia, Australian BioCommons, Threatened Species Initiative]
---

This How-to-Guide will describe the steps required to scaffold your genome on the Galaxy Australia platform, using HiC data. developed in consultations between the Bioplatforms Australia [Threatened Species Initiative](https://threatenedspeciesinitiative.com/), [Galaxy Australia](https://usegalaxy.org.au/), and the [Australian BioCommons](https://www.biocommons.org.au/).

This workflow has been created from a Vertebrate Genomes Project (VGP) scaffolding workflow. 
* For more information about the VGP project see the [Galaxy-VGP project page](https://galaxyproject.org/projects/vgp)/.
* The VGP scaffolding workflow is hosted on [Dockstore](https://dockstore.org/workflows/github.com/iwc-workflows/Scaffolding-HiC-VGP8/main:main?tab=info). Please see that link for the workflow diagram and more information if required. 
* Some minor changes have been made to better fit with TSI project data: optional inputs of SAK info and sequence graph have been removed; the required input format for the genome is changed from gfa to fasta; and the estimated genome size now requires user input rather than being extracted from output of a previous workflow.


Note: If you initially assembled the genome with HiFi data only, and you have new HiC data, you may wish to consider re-assembling the genome with the [VGP HiFi-HiC assembly pipeline](https://dockstore.org/workflows/github.com/iwc-workflows/Assembly-Hifi-HiC-phasing-VGP4/main:main?tab=info), which can give better results that using HiFi data alone. 

{% include callout.html type="note" content="If you need help, the Galaxy community is both approachable and helpful. [Ask them questions!](https://help.galaxyproject.org/)" %}

## Quick start guide

1. [Login to Galaxy Australia](#register-and-login)
2. Create a new history
3. Upload your files to your Galaxy history: ```assembly.fasta```, concatenated ```HiC_F.fastqsanger.gz```, concatenated ```HiC_R.fastqsanger.gz```. 
5. Load and execute workflows (links included below), using required options:
   - HIC SCAFFOLDING workflow: [```TSI-scaffolding-with-HiC-v1.0```](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=1054&trs_version=1)
  
## How to cite the workflows

> Syme, A. based on VGP Project (2024). **TSI-Scaffolding-with-HiC (based on VGP-HiC-scaffolding)**. WorkflowHub. <a href="https://doi.org/10.48546/WORKFLOWHUB.WORKFLOW.1054.1" ga-product="workflow_doi" ga-id="1054_conversion_qc">https://doi.org/10.48546/WORKFLOWHUB.WORKFLOW.1054.1</a>

## In-depth workflow guide

### Register and login

1. To register for Galaxy Australia, visit the [login page](https://usegalaxy.org.au/login).
2. Click the ```Register here``` link, as shown in **Fig 2**.
3. Complete the registration wizard and click ```Create```.
4. Login to your account!

{% include image.html file="hifi_assembly/1_register.png" caption="Fig 2. Log-in / registration menu for [Galaxy Australia](https://usegalaxy.org.au/)."%}

### Upload data file(s)

* Please see the how-to guide for HiFi genome assembly for additional information about uploading data from the Bioplatforms Australia Data Portal.
* Please see the HiC Scaffolding section in the [VGP assembly tutorial](https://training.galaxyproject.org/training-material/topics/assembly/tutorials/vgp_genome_assembly/tutorial.html) for additional information about this workflow. 


1. In Galaxy Australia, create a new history

   ![](../images/hifi_assembly/galaxy_history.png)

{:start="4"}

2. Import data
   
* ```assembly.fasta```. This file may be in one of your Galaxy histories.
* HiC data: concatenated ```HiC_F.fastqsanger.gz```, concatenated ```HiC_R.fastqsanger.gz```
  
### Scaffolding workflow

Please see the how-to guide for HiFi genome assembly for additional information about how to import and run workflows. A brief summary is given here:

* Import the scaffolding workflow: Go to Workflow - Import - TRS ID - make sure the TRS server is set to workflowhub.eu - type in `1054` - clck the latest version to import.
* In the Workflow tab, find this workflow and click on the triangle run button.
  
* Add in the required inputs:

  ** assembly.fasta
  ** restriction enzymes
  ** HiC forward and reverse reads - these need to be a single concatenated file for each set, and in fastqsanger.gz format
  ** Estimated genome size as integer
  ** Lineage for BUSCO

* Click Run


The main outputs are:

* scaffolded_assmbly.fasta
* comparison of pre- post- scaffolding contact maps
  


 ### Acknowledgements

 VGP Project
 TSI
 Galaxy Australia

 

  



