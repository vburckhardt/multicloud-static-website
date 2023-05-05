<!-- Remove the content in this previous H2 heading -->

# Multi-Cloud Static Website

This repository contains 2 terraform modules - one for [IBM Cloud](./ibm/), and one for [Azure](./azure/). Each of these modules preforms conceptually identical tasks:
- Create a storage instance
- Create a storage container
- Configure the storage container to serve static web content
- Deploy the static web content - located under the [static directory](./static/)

This repository also contains the [meta-data](./ibm_catalog.json) needed to onboard this project as a [Deployable Architecture](https://cloud.ibm.com/docs/secure-enterprise?topic=secure-enterprise-config-project) in IBM Cloud Catalog.
