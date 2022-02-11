#!/bin/bash

# SHPC installation on Zeus
# Run this script in the parent directory where you want to create the SHPC installation directory

# Essential for reproducibility of installation
# I have tested commit "bfa0809695054cdb16eb21920a6a4b619eea3b37"
shpc_checkout="bfa0809695054cdb16eb21920a6a4b619eea3b37"

# These might change along time, or depending on the cluster
python_ver="3.6.3"
pip_ver="19.2.1"
setuptools_ver="38.2.1"


# Should not need to edit below this line
# Apart from CUSTOM EDITS TO SHPC CONFIGURATION below


# Variable definitions for installation directories
install_dir="$(pwd)/singularity-hpc"
lib_dir="$install_dir/lib/python${python_ver%.*}/site-packages"
bin_dir="$install_dir/bin"
mod_dir="$install_dir/modules"

# Load required system modules
module load python/$python_ver
module load pip/$pip_ver
module load setuptools/$setuptools_ver

# Add installation paths to relevant environment variables
export PYTHONPATH="$lib_dir:$PYTHONPATH" 
export PATH="$bin_dir:$PATH"

# Get SHPC repo and checkout desired version/commit
git clone https://github.com/singularityhub/singularity-hpc.git
cd singularity-hpc
git checkout $shpc_checkout

# Pip installation
pip install -e . --prefix="$(pwd)"
exitcode="$?"
cd ..

echo ""
if [ "$exitcode" == "0" ] ; then
# Perform CUSTOM EDITS TO SHPC CONFIGURATION
 module load singularity
 shpc config set container_base:\$root_dir/containers
 shpc config set singularity_module:singularity
 echo ""
 echo " Installation of SHPC was successful!"
# Print information on how to use SHPC
 echo ""
 echo " To use SHPC, run the following:"
 echo "module load singularity"
 echo "module load python/$python_ver"
 echo "export PYTHONPATH="$lib_dir:\$PYTHONPATH""
 echo "export PATH="$bin_dir:\$PATH"  "
# Print information on how to use Container Modules installed by SHPC
 echo ""
 echo " To use Container Modules, run the following:"
 echo "module use $mod_dir"
else
 echo "Installation was not successful. Review the process and try again."
fi
echo ""

exit

