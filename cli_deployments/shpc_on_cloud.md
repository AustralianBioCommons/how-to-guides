---
title: Singularity HPC (SHPC) on Cloud
parent: Command Line Software Deployments
has_children: false
nav_order: 1
---

# Singularity HPC (SHPC) on Pawsey Cloud

_This documentation is intended as an overview for facility support staff and does not replace the official SHPC documentation._


## What is SHPC and why is it useful?

SHPC is a utility that allows the installation of containers as modules. This approach is largely automated and reduces the complexity of deploying and using containers. It also has the benefit of hiding the Singularity syntax for these _"modular containers"_, which reduces the complexity for users. 
When a container is loaded as a module, one can invoke the container with just name of the tool. For example, one could use `module load blast+` and then call BLAST+ with `blastn` rather than `singularity exec <container_name> blastn`.  
For containerised applications that are already available in the SHPC registry, installing and using them via SHPC is much simpler than using Singularity itself. For applications that are not yet in the registry, writing a custom container recipe may still be more time effective than learning how to use Singularity.


## Prerequisites and installation

To install and use SHPC, the following tools need to be available:
* Python 3 with _pip_ 
* A container runtime, currently one of Singularity, Docker or Podman
* System modules, either LMOD (better supported) or Environment Modules
* Nimbus image `Pawsey - Ubuntu 18.04 - 2021-02` and above

### Install Pip

    apt update
    apt install -y python3-pip  

### Install Lmod

    apt-get install -y lua5.3 \
    lua-bit32:amd64 \
    lua-posix:amd64 \
    lua-posix-dev \
    liblua5.3-0:amd64 \
    liblua5.3-dev:amd64 \
    tcl \
    tcl-dev \
    tcl8.6 \
    tcl8.6-dev:amd64 \
    libtcl8.6:amd64
    
    wget https://sourceforge.net/projects/lmod/files/Lmod-8.5.tar.bz2
    tar xf Lmod-8.5.tar.bz2
    cd Lmod-8.5/
    ./configure
    sudo make install
    sudo ln -s /usr/local/lmod/lmod/init/profile /etc/profile.d/z00_lmod.sh
    
    sudo echo 'if ! shopt -q login_shell; then
    if [ -d /etc/profile.d ]; then
        for i in /etc/profile.d/*.sh; do
        if [ -r $i ]; then
            . $i
        fi
        done
    fi
    fi' >> ~/.bashrc
    
    sudo echo 'module use /SHPC/singularity-hpc/modules' >> ~/.bashrc
    
    cd ..
    rm -rf Lmod-8.5/

### Install SHPC:

    sudo mkdir /shpc
    sudo chown ubuntu /shpc
    git clone https://github.com/singularityhub/singularity-hpc.git
    cd singularity-hpc
    pip install -e .[all]
    cd ..
    sudo mkdir /shpc/modules
    sudo mkdir /shpc/registry
    sudo chown ubuntu /shpc/*
    sudo mv singularity-hpc/registry/* /shpc/registry/
    mkdir $HOME/containers
    sudo chown ubuntu $HOME/containers
    shpc config set container_base:$HOME/containers
    shpc config set module_base:/shpc/modules
    shpc config add registry:/shpc/registry


## Deploying and using container modules

SHPC has a registry of commonly used software which are available to download. For example, to download the BWA package:

```bash
# search for a package in SHPC registry (string search)
$ shpc show -f bwa
quay.io/biocontainers/bwa
quay.io/biocontainers/bwa-mem2
biocontainers/bwa
ghcr.io/autamus/bwa

# inspect specific container recipe
$ shpc show quay.io/biocontainers/bwa
docker: quay.io/biocontainers/bwa
url: https://quay.io/repository/biocontainers/bwa
maintainer: '@marcodelapierre'
description: BWA is a program for aligning sequencing reads against a large reference
  genome.
latest:
  0.7.17--h5bf99c6_8: sha256:f8494324de6da332792dc8e4acc2549152375e1966c96163087d6ff6d42ff48c
tags:
  0.7.17--h5bf99c6_8: sha256:f8494324de6da332792dc8e4acc2549152375e1966c96163087d6ff6d42ff48c
aliases:
  bwa: /usr/local/bin/bwa

# install desired version tag
$ shpc install quay.io/biocontainers/bwa:0.7.17--h5bf99c6_8
singularity pull --name /data/shpc-containers/quay.io/biocontainers/bwa/0.7.17--h84994c4_4/quay.io-biocontainers-bwa-0.7.17--h84994c4_4-sha256:4f183ae370c240d175cd55424538b39f047c8add50896de896f0d12a73d4a9a0.sif docker://quay.io/biocontainers/bwa@sha256:4f183ae370c240d175cd55424538b39f047c8add50896de896f0d12a73d4a9a0
INFO:    Converting OCI blobs to SIF format
INFO:    Starting build...
Getting image source signatures
 
[..]
 
INFO:    Creating SIF file...
/data/shpc-containers/quay.io/biocontainers/bwa/0.7.17--h84994c4_4/quay.io-biocontainers-bwa-0.7.17--h84994c4_4-sha256:4f183ae370c240d175cd55424538b39f047c8add50896de896f0d12a73d4a9a0.sif
Module quay.io/biocontainers/bwa:0.7.17--h84994c4_4 was created.
```

The BWA module can then be loaded, and the tool is available using its familiar syntax:

```bash
# search module
$ module avail bwa
 
-------------------------------------------------- /shpc/modules ---------------------------------------------------
   quay.io/biocontainers/bwa/0.7.17--h84994c4_4/module

# load module
$ module load quay.io/biocontainers/bwa/0.7.17--h84994c4_4/module

# test command
$ bwa
```


## Writing your own module recipes

What if a software container is not in the SHPC registry? In this case, you can write your own container recipe for SHPC. This is essentially a YAML file with instructions of where to look for the desired container online. This YAML needs to reside in the `registry` directory of SHPC. Biocontainers is a good default source of well-curated containers, on [quay.io](https://quay.io). 

Here is an example with the Velvet pacakge:

```bash
# get registry location
$ shpc config get registry
registry                       /shpc/registry
 
# create directory tree for desired Velvet container recipe
$ mkdir -p /shpc/registry/quay.io/biocontainers/velvet
 
# create a new YAML container recipe in the new path (using vi as text editor here)
$ vi /shpc/registry/quay.io/biocontainers/velvet/container.yaml
```

Let’s look at the contents of the yaml file for Velvet.

```bash
docker: quay.io/biocontainers/velvet
 
latest:
  "1.2.10--h5bf99c6_4": "sha256:7fc2606a1431883dcd0acf830abcfeddb975677733d110a085da0f07782f5a27"
tags:
  "1.2.10--h5bf99c6_4": "sha256:7fc2606a1431883dcd0acf830abcfeddb975677733d110a085da0f07782f5a27"
  "1.2.10--hed695b0_3": "sha256:b17fd98d802c1e78dde5fd2c5431efc1969db35a279f3a5ca7afcb46efc66e4a"
 
maintainer: "@marcodelapierre"
 
# these are optional
description: "Velvet is a sequence assembler for short reads."
url: https://quay.io/repository/biocontainers/velvet
 
aliases:
  velvetg: /usr/local/bin/velvetg
  velveth: /usr/local/bin/velveth
```

Let's comment on the key components of this YAML file:
* `docker` is the repository path for the container, without version tags
* `tags` is a list of container tags (versions) with the corresponding SHA message digest (shasum); these need to be manually collected from the repository website, in this case https://quay.io/repository/biocontainers/velvet?tab=tags 
* `latest` is a copy-paste of the most recent tag version from above, to be used as _"latest"_ version
* `maintainer` is the Github username of the creator (required to contribute the recipe back to the Github repository of SHPC; put any name if you don't have one)
* `aliases` is a list of command names that will be made available by the SHPC module, with the corresponding commands from inside the container; these need to be manually provided, either by reading through the documentation of the package, or by downloading and inspecting the container

Once you have finished writing the recipe, you can install Velvet just as we did with BWA previously. 


## Updating the registry

Run the following commands to update your local SHPC registry:

    git clone https://github.com/singularityhub/singularity-hpc.git
    sudo mv $PWD/singularity-hpc/registry/* /shpc/registry/
