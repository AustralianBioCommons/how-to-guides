---
title: Upload data file(s)
---

{% include callout.html type="note" content="FAQ: can data be seamlessly transferred from the Data Portal to Galaxy Australia?
The Australian BioCommons is working with the Bioplatforms Australia data portal team to develop a direct transfer mechanism from the portal to Galaxy Australia histories. 
This solution will be made available as soon as possible." %}

## Select your data 

### Using the [Bioplatforms Australia Data Portal](https://data.bioplatforms.com/)
- The files you need for the assembly are ```.css.bam``` format
- Fig 1 shows a HiFi data set selected in the data portal browser interface.

## Click ```Access``` and select ```Copy Download URL``` in the drop down menu (see Fig. 1)

{% include callout.html type="note" content="This will copy a download URL to your clipboard." %}

{% include callout.html type="warning" content="The URL is time sensitive and will expire after 10 minutes." %}

{% include callout.html type="warning" content="You only need to instigate the download (next step) within this 10 minute window." %}

{% include callout.html type="warning" content="The import itself can take longer than 10 minutes." %}

{% include image.html file="hifi_assembly/data_portal.png" caption="Fig 1. The appearance of a HiFi data set in the Bioplatforms Australia data portal browser interface." %}

## In Galaxy Australia, perform the steps outlined in Fig. 2

1. Click on ```Upload Data``` 
2. Select ```Paste/Fetch data```
3. Paste the URL you obtained from the data portal into the content box.
4. Select ```Start```

{% include callout.html type="note" content="You can paste multiple URLs in this box. If you have more than 1 SMRT cell of data, you will need to copy the URLs for each of the ```ccs.bam``` files and paste them in here." %}

{% include image.html file="hifi_assembly/import_data.png" caption="Fig 2. Process required for download of data based on a URL provided to Galaxy Australia." %}

## Other options are also available

### Self-managed (download & upload)

1. [Download](https://usersupport.bioplatforms.com/programmatic_access.html) required HiFi data to your personal computer, then
2. Upload / transfer to Galaxy Australia (see **Fig 3**)
     - Note: the following Galaxy Training Network tutorial provides guidance on [how to upload files via URL](https://training.galaxyproject.org/training-material/topics/introduction/tutorials/galaxy-intro-short/tutorial.html#upload-a-file). The same mechanism can be used to upload local files, by selecting ```Choose local files``` (see **Fig 3**).

{% include image.html file="hifi_assembly/2_upload.png" caption="Fig 3. Choosing local files to upload to Galaxy Australia." %}

### Self-managed (Cloudstor mediated)

1. Upload / transfer data to Cloudstor (see [Getting Started Guide](https://support.aarnet.edu.au/hc/en-us/articles/227469547-CloudStor-Getting-Started-Guide)), then
2. Upload / transfer to Galaxy Australia (see ```Import from CloudStor``` tool in Galaxy Australia)

### Supported

- Contact the [Galaxy Australia Support team](mailto:help@genome.edu.au) for data chaperoning
