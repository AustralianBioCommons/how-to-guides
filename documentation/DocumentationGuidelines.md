---
title: Documentation Guidelines for tools and workflows
---

**Do you want your tools and workflows to be documented in a standard way?**

**If the answer is yes, then read on!**

## Why do the [documentation guidelines](https://github.com/AustralianBioCommons/doc_guidelines) exist?

The Australian BioCommons has been working with community bioinformaticians and our infrastructure partners to establish a guidelines repository that can act as a template for documentation of tools and workflows.

The repository aims to provide guidance and a minimal starting template for:

- Documenting a new [tool](https://github.com/AustralianBioCommons/doc_guidelines/blob/master/tools.md) or [workflow](https://github.com/AustralianBioCommons/doc_guidelines/blob/master/workflows.md)
- Documenting tool or workflow access, use and [optimisation on infrastructures](https://github.com/AustralianBioCommons/doc_guidelines/blob/master/infrastructure_optimisation.md)
- Recommending additional repository contents that make your work more [FAIR](https://www.go-fair.org/fair-principles/)

>The Australian BioCommons guidelines are based on learnings from existing efforts, including our own projects, but also the Galaxy, NextFlow and Snakemake communities.

## Should I contribute to an existing community workflow effort instead?

The [BioCommons guideline](https://github.com/AustralianBioCommons/doc_guidelines) is based on learnings from multiple community efforts including the Galaxy [Intergalactic Workflow Commission (IWC)](https://github.com/galaxyproject/iwc), [nf-core](https://nf-co.re/) and [Snakemake](https://github.com/snakemake-workflows).

If you are using Galaxy, Nextflow or Snakemake workflow languages and would like to contribute to their community workflow efforts, **you could be using their specific guidelines**, which are linked to below.

| Community effort | Workflow language documentation | Workflow guideline information | How to create / contribute new workflows |
|:----:|:----:|:----:|:----:|
|IWC | Galaxy |[IWC GitHub](https://github.com/galaxyproject/iwc/blob/main/workflows/README.md#workflows)|[IWC adding workflows](https://github.com/galaxyproject/iwc/blob/main/workflows/README.md#adding-workflows)|
|nf-core | Nextflow |[nf-core developer guidelines](https://nf-co.re/developers/guidelines)|[nf-core adding_pipelines](https://nf-co.re/developers/adding_pipelines)|
|Snakemake | Snakemake |[Snakemake-workflows guidelines](https://github.com/snakemake-workflows/docs#guidelines)|[Snakemake-workflows contribute](https://github.com/snakemake-workflows/docs#contribute)|

## Is there a way to let people know how my repository should be cited?

The [documentation guidelines](https://github.com/AustralianBioCommons/doc_guidelines) include a `CITATION.cff` file to highlight 
how the repository and its contents should be cited. 

> Druskat, Stephan, Spaaks, Jurriaan H., Chue Hong, Neil, Haines, Robert, Baker, James, Bliven, Spencer, Willighagen, Egon, Pérez-Suárez, David, & Konovalov, Alexander. (2021). **Citation File Format (1.2.0)**. Zenodo. https://doi.org/10.5281/zenodo.5171937

Below is an example of this file format being used by the [Sydney Informatics Hub](https://www.sydney.edu.au/research/facilities/sydney-informatics-hub.html). 
The file is available [here](https://github.com/Sydney-Informatics-Hub/GermlineShortV_biovalidation/blob/main/CITATION.cff).

```
cff-version: 1.0.0
message: "If you use this software, please cite it as below."
authors:
  - family-names: "Samaha"
    given-names: "Georgina"
    orcid: "https://orcid.org/0000-0003-0419-1476"
  - family-names: "Willet"
    given-names: "Cali"
    orcid: "https://orcid.org/0000-0001-8449-1502"
  - family-names: "Deshpande"
    given-names: "Nandan"
    orcid: "https://orcid.org/0000-0002-0324-8728"
  - family-names: "Chew"
    given-names: "Tracy"
    orcid: "https://orcid.org/0000-0001-9529-7705"
title: "GermlineShortV_biovalidation"
version: 1.0
doi: 10.48546/workflowhub.workflow.339.1
date-released: 2022-05-05
url: "https://github.com/Sydney-Informatics-Hub/GermlineShortV_biovalidation"
```

## What does the BioCommons template repository look like?

![](images/example_structure.png)


## How might I use the BioCommons guidelines?

![](images/example_uses_1.png)

