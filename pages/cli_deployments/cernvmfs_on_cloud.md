---
title: CernVM-FS on Pawsey Cloud
---

This document is designed to provide current users at [Pawsey Supercomputing Centre](https://pawsey.org.au) easy access to a reference dataset repository, through CernVM-FS.


## What is CernVM-FS and why is it useful?

"The CernVM File System (CernVM-FS) is a read-only file system designed to deliver scientific software onto virtual machines and physical worker nodes in a fast, scalable, and reliable way. Files and file metadata are downloaded on demand and aggressively cached." - [CernVM-FS](https://cvmfs.readthedocs.io/en/stable/cpt-overview.html)

CernVM-FS is a useful solution for ensuring access to commonly used datasets is centralised and easy, and the datasets always updated on the main repository server (Stratum 0), mirrored by replica web servers (Stratum 1), fetched by the proxies (Stratum 2), and accessible to the clients (Stratum 3).

At Pawsey Supercomputing Centre, at present, users on the [Nimbus cloud service](https://pawsey.org.au/systems/nimbus-cloud-service/) can access the Galaxy Project's CernVM-FS data repository webserver /cvmfs/data.galaxyproject.org.


## Installation

Setting up CernVM-FS access on Nimbus instances is simple and quick. It requires only running three lines of code:

    git clone https://github.com/qcif/cvmfs-setup-galaxy.git
    cd cvmfs-setup-galaxy/
    sudo ./cvmfs-galaxy-client-setup.sh cvmfs-cachingproxy.pawsey.org.au


## Using CernVM-FS

Users will simply access the data sets as though part of their file system, e.g. accessing the Galaxy project's data repository web server (Stratum 1) is as simple as this:

    ls /cvmfs/data.galaxyproject.org

Once the above path is cached, the user can explore all repositories under /cvmfs. When running analyses, the reference file need only be pointed to the appropriate directory path.
    

## Acknowledgements

This work is jointly supported by Pawsey Supercomputing Centre and the Australian BioCommons. Special thanks to QCIF for providing the simple setup code.


## See also

- [CernVM-FS setup for Galaxy Project CVMFS repositories](https://github.com/qcif/cvmfs-setup-galaxy)
- [CernVM-FS documentation](https://cvmfs.readthedocs.io/en/stable/)
