# IBM Cloud Static Website

A module creating a Cloud Object Storage instance with a bucket to serve static web content. The content that is served is copied from the [static directory](../static/).

![Architecture Diagram](../images/ibm-arch-diagram.svg)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.51.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cos_instance_bucket"></a> [cos\_instance\_bucket](#module\_cos\_instance\_bucket) | git::https://github.com/terraform-ibm-modules/terraform-ibm-cos | v6.2.0 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::https://github.com/terraform-ibm-modules/terraform-ibm-resource-group.git | v1.0.5 |

## Resources

| Name | Type |
|------|------|
| [ibm_cos_bucket_object.file](https://registry.terraform.io/providers/ibm-cloud/ibm/1.51.0/docs/resources/cos_bucket_object) | resource |
| [ibm_iam_access_group_policy.cos_public_access_policy](https://registry.terraform.io/providers/ibm-cloud/ibm/1.51.0/docs/resources/iam_access_group_policy) | resource |
| [null_resource.configure_cos_bucket_static_website](https://registry.terraform.io/providers/hashicorp/null/3.2.1/docs/resources/resource) | resource |
| [random_string.bucket_name_suffix](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/string) | resource |
| [ibm_iam_access_group.public_access](https://registry.terraform.io/providers/ibm-cloud/ibm/1.51.0/docs/data-sources/iam_access_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | The IBM Cloud API Token from an account with sufficient permissions to deploy resources | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix added to all resources created in this module | `string` | `"static-web-demo"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where resources will be created | `string` | `"eu-gb"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Name of existing resource group to use.  Leave as null to create one with the given prefix value | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_url"></a> [url](#output\_url) | url |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- BEGIN CONTRIBUTING HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
<!-- Source for this readme file: https://github.com/terraform-ibm-modules/common-dev-assets/tree/main/module-assets/ci/module-template-automation -->
<!-- END CONTRIBUTING HOOK -->
