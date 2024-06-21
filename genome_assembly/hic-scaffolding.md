---
title: Genome scaffolding with Hi-C on Galaxy Australia
type: genome-assembly
contributors: [VGP Project, Luke Silver, Anna Syme]
description: This guide describes the steps required to scaffold your genome on the Galaxy Australia platform using HiC data
affiliations: [Bioplatforms Australia, Galaxy Australia, Australian BioCommons, Threatened Species Initiative]
---

This How-to-Guide will describe the steps required to scaffold your genome on the Galaxy Australia platform using a HiC scaffolding workflow developed in consultations between the Bioplatforms Australia [Threatened Species Initiative](https://threatenedspeciesinitiative.com/), [Galaxy Australia](https://usegalaxy.org.au/), and the [Australian BioCommons](https://www.biocommons.org.au/).

This workflow has been created from a Vertebrate Genomes Project (VGP) scaffolding workflow. 
* For more information about the VGP project see the [Galaxy-VGP project page](https://galaxyproject.org/projects/vgp).
* The VGP scaffolding workflow is hosted on [Dockstore](https://dockstore.org/workflows/github.com/iwc-workflows/Scaffolding-HiC-VGP8/main:main?tab=info). Please see that link for the workflow diagram and more information if required. 
* Some minor changes have been made to better fit with TSI project data: optional inputs of SAK info and sequence graph have been removed; the required input format for the genome is changed from gfa to fasta; and the estimated genome size now requires user input rather than being extracted from output of a previous workflow.

Please see the HiC Scaffolding section in the [VGP assembly tutorial](https://training.galaxyproject.org/training-material/topics/assembly/tutorials/vgp_genome_assembly/tutorial.html) for additional information about this workflow. 

Note: If you initially assembled the genome with HiFi data only, and you have new HiC data, you may wish to consider re-assembling the genome with the [VGP HiFi-HiC assembly pipeline](https://dockstore.org/workflows/github.com/iwc-workflows/Assembly-Hifi-HiC-phasing-VGP4/main:main?tab=info), which can give better results than using HiFi data alone. 

{% include callout.html type="note" content="If you need help, the Galaxy community is both approachable and helpful. [Ask them questions!](https://help.galaxyproject.org/)" %}

### Register and login

1. To register for Galaxy Australia, visit the [login page](https://usegalaxy.org.au/login).
2. Click the ```Register here``` link.
3. Complete the registration wizard and click ```Create```.
4. Login to your account!

### Upload data files

Please see the how-to guide for HiFi genome assembly for additional information about uploading data from the Bioplatforms Australia Data Portal.

* In Galaxy Australia, create a new history
* Import data
    * ```assembly.fasta```. This file may be in one of your Galaxy histories.
    * HiC data: concatenated ```HiC_F.fastqsanger.gz```, concatenated ```HiC_R.fastqsanger.gz```
  
### Import the scaffolding workflow

Please see the how-to guide for HiFi genome assembly for additional information about how to import and run workflows. 

* [Visit this link](https://usegalaxy.org.au/workflows/trs_import?trs_server=workflowhub.eu&run_form=true&trs_id=1054) to:
   - Retrieve the workflow for `TSI-Scaffolding-with-HiC`
   - Import into your Galaxy Australia workflows

### Run the workflow

* Click on the Workflow tab, find this workflow and click on the triangle run button.
* Add in the required inputs:
    * assembly.fasta
    * restriction enzymes
    * HiC forward and reverse reads - these need to be a single concatenated file for each set, and in fastqsanger.gz format
    * Estimated genome size as integer
    * Lineage for BUSCO
* Click Run

### Check the outputs

The main outputs are:
* scaffolded_assmbly.fasta
* comparison of pre- post- scaffolding contact maps

For more information about what these outputs mean, please see the HiC Scaffolding section in the [VGP assembly tutorial](https://training.galaxyproject.org/training-material/topics/assembly/tutorials/vgp_genome_assembly/tutorial.html).

 ## Acknowledgements

* We acknowledge and thank the Vertebrate Genomes Project for this workflow. This is not original work, but extracted from the VGP scaffolding workflow with some minor changes to inputs to better support various groups of researchers. More information about VGP workflows: [Galaxy-VGP project page](https://galaxyproject.org/projects/vgp).
* Bioplatforms Australia [Threatened Species Initiative](https://threatenedspeciesinitiative.com/)
* [Galaxy Australia](https://usegalaxy.org.au/)
* The [Australian BioCommons](https://www.biocommons.org.au/).

Workflow citation: 

> Syme, A., Silver, L., based on VGP Project (2024). **TSI-Scaffolding-with-HiC (based on VGP-HiC-scaffolding)**. WorkflowHub. [https://doi.org/10.48546/WORKFLOWHUB.WORKFLOW.1054.1](https://doi.org/10.48546/WORKFLOWHUB.WORKFLOW.1054.1)

  



