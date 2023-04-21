<!-- Remove the content in this previous H2 heading -->
## Reference architectures

<!--
Add links to any reference architectures for this module.
(Usually in the `/reference-architectures` directory.)
See "Reference architecture" in Authoring Guidelines in the public documentation at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=reference-architecture
-->

## Usage

<!--
Add an example of the use of the module in the following code block.

Use real values instead of "var.<var_name>" or other placeholder values
unless real values don't help users know what to change.
-->

```hcl

```

## Required IAM access policies

<!-- PERMISSIONS REQUIRED TO RUN MODULE
If this module requires permissions, uncomment the following block and update
the sample permissions, following the format.
Replace the sample Account and IBM Cloud service names and roles with the
information in the console at
Manage > Access (IAM) > Access groups > Access policies.
-->

<!--
You need the following permissions to run this module.

- Account Management
    - **Sample Account Service** service
        - `Editor` platform access
        - `Manager` service access
    - IAM Services
        - **Sample Cloud Service** service
            - `Administrator` platform access
-->

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->
<!-- END MODULE HOOK -->
<!-- BEGIN EXAMPLES HOOK -->
## Examples

- [ Default example](examples/default)
- [ Example that uses existing resources](examples/existing-resources)
- [ Non default example](examples/non-default)
<!-- END EXAMPLES HOOK -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.52.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/3.52.0/docs/resources/resource_group) | resource |
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/3.52.0/docs/resources/storage_account) | resource |
| [azurerm_storage_blob.file](https://registry.terraform.io/providers/hashicorp/azurerm/3.52.0/docs/resources/storage_blob) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | A description of my variable | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | A description of my variable | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix added to all resources created in this module | `string` | `"demoweb"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | A description of my variable | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | A description of my variable | `string` | n/a | yes |

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
