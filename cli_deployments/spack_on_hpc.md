---
title: Spack on Pawsey HPC
---

This document is designed to give compute facility support staff a high-level overview of the use cases for Spack and its key features, plus some more specific information on how to use the tool.  
This document is not designed to replace the comprehensive [documentation](https://spack.readthedocs.io/en/latest/index.html) provided by the Spack team. 


## What is Spack and why is it useful?

Spack is a package manager designed for HPC that supports multiple versions and configurations of software on a wide variety of architectures. It reduces the complexity for software installations on _exotic_ architectures and/or needing libraries that do not have a standard ABI. In short, you can manage tricky installations with simple syntax. An example of usage at the Pawsey Centre is to install packages that require specific optimisation for performance, as opposed to use of generic containers. The Spack-installed software can be invoked by calling the executable with the full path, using spack load, or generating a modulefile with Spack and using it.

### Key features include:

- Can specify the version, build compiler, compile-time options, and cross-compile platform
- Customisation of dependencies
- Non-destructive installs (each install has its own prefix, so new installs won’t break old ones)
- Multiple package versions and variants can co-exist
- Creating new Spack install recipes packages is fairly easy, requiring a URL for the source archive
- Can be tuned for usage of available compilers and performance libraries, specification of directory trees for installed packages and modules, and control over naming convention and features of generated modulefiles


## Pre-requisites 

**Essential** 
- Python 3.5-3.9 (Python 2 is being deprecated)
- C/C++ Compilers 
- make 
- patch 
- bash 
- tar 
- gzip 
- unzip 
- bzip 
- xz 
- cpio 
- file 
- gnupg2 
- git 

**Optional** 
- svn 
- hg 
- zstd 
- Python header files 


## Installation

You can clone Spack from the github repository using this command:
```bash
$ git clone -c feature.manyFiles=true https://github.com/spack/spack.git
```
The default git branch is the _develop_ one. This is where developers daily commit changes to the code base, so using it for production is risky. It's better to select a stable _release_branch, _e.g._:
```bash
$ git checkout releases/v0.16
```

### Configuration for system administrators

Whereas the default configurations may work well for single-user installations on workstations and cloud, administrators of institutional clusters typically need to customise Spack configuration. Spack allows to customise a lot of its functionalities, by editing dedicated YAML configuration files. The most important ones are:
- `compilers.yaml`: manually specify location of system compilers (`spack compiler find` can assist)
- `packages.yaml`: among other options, specify location of system packages that need to be used instead of Spack-built ones; a good use case is for MPI libraries that are already configured for the system interconnect (`spack external find` can assist)
- `config.yaml`: specify paths for service directories, such as for builds and caches; also customise some high-level options
- `modules.yaml`: customise modulefile generation

Pawsey will host its Spack configuration files for Setonix on Github at [PawseySC/pawsey-spack-config](https://github.com/PawseySC/pawsey-spack-config). Meanwhile, some test configuration files are available, that can be helpful as a starting point, _e.g._ [zeus/configs](https://github.com/PawseySC/pawsey-spack-config/tree/main/examples/zeus/configs).


## Using Spack

First, users need to enable the Spack shell configurations with the following command (assuming that Spack is installed in `$MYSPACK` and that the `bash` shell is in use):
```bash
$ . $MYSPACK/share/spack/setup-env.sh
```

Users can then invoke Spack with the `spack` command. spack accepts a subcommand, or Spack command, as the first argument:
```bash
$ spack <subcommand>
```
Use the following subcommands in order:
1.	Use `list` to look for package recipes.
2.	Use `info` to inspect available options for a given package.
3.	Use `spec` to test installation and required dependencies for a given package. Always test an installation with `spec` before running `install`.
4.	Finally, proceed with the `install` subcommand for a given package.

A comprehensive list of Spack commands can be inspected by using variations of the `help` subcommand.
```bash
$ spack help
$ spack help --all
$ spack <subcommand> -h
```

## Using spack load

The load/unload command provides a simple fashion of updating the PATH environment variable to include software built by Spack. If several different versions of the package have been built by Spack, you will need to specify the desired spec. You can investigate the installed software using the find subcommand. Once a path has been updated you can use the executable.  

```bash
# list the variants and dependencies of fftw
$ spack find -vd fftw 

-- linux-sles15-zen3 / gcc@11.1.0 -----------------------------
fftw@3.3.7~mpi~openmp~pfft_patches precision=double,float
 
fftw@3.3.7~mpi+openmp~pfft_patches precision=double,float
 
fftw@3.3.8~mpi~openmp~pfft_patches precision=double,float

# try loading any fftw
$ spack load --sh fftw

==> Error: fftw matches multiple packages.
  Matching packages:
    m4vsnhq fftw@3.3.7%gcc@11.1.0 arch=linux-sles15-zen3
    ax6d2kl fftw@3.3.7%gcc@11.1.0 arch=linux-sles15-zen3
    7mlxv4g fftw@3.3.8%gcc@11.1.0 arch=linux-sles15-zen3
  Use a more specific spec.
  
$ spack load --sh fftw@3.3.7 # try loading a specific version
==> Error: fftw@3.3.7 matches multiple packages.
  Matching packages:
    m4vsnhq fftw@3.3.7%gcc@11.1.0 arch=linux-sles15-zen3
    ax6d2kl fftw@3.3.7%gcc@11.1.0 arch=linux-sles15-zen3
  Use a more specific spec.
  
# load the version and variant that uniquely identifies the package
$ spack load --sh fftw@3.3.7+openmp 
```

## Generating and using a modulefile

To generate modulefiles for Spack-built packages use the idiomatic syntax below. You will then be able to see them with `module avail` and use them with `module load/unload` (a shell logout/login may be required the first time).

```bash
# generate LUA modulefiles for Lmod
$ spack module lmod refresh --delete-tree -y  

==> Regenerating lmod module files

# add the modules listed in the $SPACK_ROOT/share/spack/lmod directory
$ module use -l /dir/to/spack/share/spack/lmod/
 
### Logout/Login if very first time that Spack modules are generated
 
# list the fftw modules available 
$ module avail fftw
linux-sles15-x86_64/gcc/11.1.0/fftw/3.3.7-aormek7
linux-sles15-x86_64/gcc/11.1.0/fftw/3.3.7-ibdoa45
linux-sles15-x86_64/gcc/11.1.0/fftw/3.3.8-ggtdo27

# load a particular fftw library
$ module load linux-sles15-x86_64/gcc/11.1.0/fftw/3.3.7-aormek7

# to determine if this module is the correct variant one can examine the module file itself
$ head -4 /dir/to/spack/share/spack/lmod/linux-sles15-x86_64/gcc/11.1.0/fftw/3.3.7-aormek7.lua | tail -1
-- fftw@3.3.7%gcc@11.1.0~mpi~openmp~pfft_patches precision=double,float arch=linux-sles15-zen3/aormek7

# compare this to other 3.3.7 module
$ head -4 /dir/to/spack/share/spack/lmod/linux-sles15-x86_64/gcc/11.1.0/fftw/3.3.7-ibdoa45.lua | tail -1
-- fftw@3.3.7%gcc@11.1.0~mpi+openmp+pfft_patches patches=8132c27659f992311dcf3d1500056e0f9400aa22f6824124e3607dbaa8dfe3c0 precision=double,float arch=linux-sles15-zen3/ibdoa45
```
