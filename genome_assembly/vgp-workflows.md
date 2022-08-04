## **How to use the international Vertebrate Genome Project workflows in Galaxy Australia**

Anna Syme

## What are the VGP workflows?

* These are workflows for genome assembly, developed for the Vertebrate Genome Project
* Website: https://vertebrategenomesproject.org/
* Data at Genome Ark  https://vgp.github.io/genomeark/
* Paper: Rhie, A., McCarthy, S.A., Fedrigo, O. et al. Towards complete and error-free genome assemblies of all vertebrate species. Nature 592, 737–746 (2021). https://doi.org/10.1038/s41586-021-03451-0
* This paper covers the testing of tools and workflows. We recommend also looking at the Supplementary Information which is very informative.

## Are the VGP workflows in Galaxy?

* Yes. An international team is working to create these workflows in Galaxy. 
* For more information see https://galaxyproject.org/projects/vgp/
* But note that the links there are to the Galaxy Eu server (not Galaxy Au), and some of the workflow links may not be the most recent (see later in this document for more recent links). 

## Can I use the VGP workflows in Galaxy Australia?
* Yes. You can run these on test data or real data. They are designed to work for vertebrate genomes where you have Hifi, HiC and bionano data. 
* The workflows are described in Galaxy Training Network materials. 
* [VGP assembly pipeline - short version, although still with complete workflow](https://training.galaxyproject.org/training-material/topics/assembly/tutorials/vgp_workflow_training/tutorial.html)
* [VGP assembly pipeline - long version](https://training.galaxyproject.org/training-material/topics/assembly/tutorials/vgp_genome_assembly/tutorial.html)
* You can get the workflows and datasets from there and import them into your own Galaxy Australia account. 
* Alternatively, a recent workflow version (August 4 2022) has been imported via the Galaxy Training Network, and published in Galaxy Australia: https://usegalaxy.org.au/u/anna/w/vgp-assembly-training-workflow-imported-from-uploaded-file-2
* A test data set, from the Galaxy Training Network, has been uploaded to this history: https://usegalaxy.org.au/u/anna/h/gtn-vgp-tutorial-data-march-2022


## What data do I need?

* PacBio Hifi reads in fasta format, in a collection
* Bionano data in cmap format
* HiC reads, two files (F and R) in fastq format

## What is going on in the workflows?

* The workflows are large and have many steps. 
* To better understand the workflow, look at the workflow canvas, view each tool and its settings, see how each step is connected. 
* Consider what outputs you would require and make sure it is clear where they are and what they are called. 

## Run the workflows on test data

* Look at the outputs and see if it makes sense and all tools ran. 

## Import real data

* If you will be using real vertebrate genome data, it is likely you will need more Galaxy storage. Contact the Galaxy Australia team to discuss/request. 
* Import your real data sets into Galaxy.
* Or, to use real VGP data, go to **Upload Data: Choose remote files: Genome Ark: species** and choose a species. 
* Note: not all species have data from all Hifi, HiC and bionano sources. 
* Note that you will likely have to convert the data into the correct formats required. Alternatively, modify the workflows themselves to accept the data in the formats you have. 

## Run the workflows on real data

* Do any QC required, as this is not in the current workflow.
* Modify workflows as needed: label or tag outputs, change tool parameters, swap tools, add or delete steps. 
* For large data we would recommend testing tools and workflows on a subset of the data first.
