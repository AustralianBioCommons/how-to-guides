---
title: "HiFi genome assembly on Galaxy Australia"
nav_order: 2
---

---

# *De novo* genome assembly with hifiasm on [Galaxy Australia](https://usegalaxy.org.au/)

[Galaxy Australia](https://usegalaxy.org.au/) is capable of *de novo* assembling genomes based on PacBio high fidelity reads built from circular consensus sequence HiFi reads.

This How-to-Guide will describe the steps required to assemble your genome on the Galaxy Australia platform, using multiple workflows (see **Fig 1**) developed in consultations between the Bioplatforms Australia [Threatened Species Initiative](https://threatenedspeciesinitiative.com/), [Galaxy Australia](https://usegalaxy.org.au/), and the [Australian BioCommons](https://www.biocommons.org.au/).

---

# First things first: are you familiar with Galaxy Australia?

## **Yes**

- Take me to the Quick start guide!
- Show me the WorkflowHub entries
     - File conversion: [BAM to FASTQ + QC](https://workflowhub.eu/workflows/220)
     - Assembly: [PacBio HiFi genome assembly using hifiasm](https://workflowhub.eu/workflows/221)
     - Purge duplicates: [Purge duplicates from hifiasm assembly]()

## **No**

- Take me to the in-depth guide!
- Take me to more training material for Galaxy

> **If you need help, the Galaxy community is both approachable and helpful.**
[**Ask them questions!**](https://help.galaxyproject.org/)

---

# The overall workflow

![**Fig 1.** The approach described in this How-to-Guide, including Quick Start guide steps **1)** registration, 
**2)** upload of input BAM file, **3)** BAM to FASTQ conversion workflow, **4)** assembly workflow, **5)** purge 
duplicates workflow and **6)** reviewing the assembly report and FASTA metrics. Required workflow 
steps are blue, and optional steps are red.](/images/overall_workflow.png)

Further to this, a summary of the different elements of this assembly approach are detailed below:

| Process name     | Workflow name                             | Description                                                                          | Inputs                                                              | Outputs                                                                                                     |
| ---------------- | ----------------------------------------- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| UPLOAD FILES     | Not applicable                            | See the different upload options in section 5.2.                                     | BAM (start at step 3 in Fig 1), or FASTQ (start at step 4 in Fig 1) | Not applicable                                                                                              |
| FILE CONVERSION  | BAM to FASTQ + QC                         | Conversion of files from BAM to FASTQ, including a FASTQC quality control (QC) step. |                                                                     | FASTQ file, FASTQC report HTML file                                                                         |
| ASSEMBLY         | PacBio HiFi genome assembly using hifiasm | Assembly using the hifiasm tool, including Bandage visualisation and QC.             |                                                                     | Assembly file in FASTA format, FASTA metrics, Assembly report file                                          |
| PURGE DUPLICATES | Purge duplicates from hifiasm assembly    | Optional workflow to purge duplicates from the contig assembly.                      |                                                                     | Purged primary sequences from draft assembly (FASTA), Purged haplotig sequences from draft assembly (FASTA) |

---

# Quick start guide

## Login to Galaxy Australia

## Create a new history

## Upload your HiFi ```ccs.bam``` data files to your Galaxy history

## Load and execute workflows, using required options
     
- FILE CONVERSION workflow: ```BAM to FASTQ + QC``` **optional**
- ASSEMBLY workflow: ```PacBio HiFi genome assembly workflow```
- PURGE DUPLICATES workflow: ```Purge duplicates from hifiasm assembly``` **optional**

## Review workflow report and perform additional QC as needed

## Re-run workflows, or individual tools, as needed

---

# In-depth guide
