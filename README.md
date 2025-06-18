## Terraform AWS VPC Peering

A Terraform module to create secure and configurable VPC peering connections across the same or different AWS accounts and regions, including automatic route table updates.
## Architecture

![vpc_peering](https://github.com/user-attachments/assets/c869daac-7aff-4acd-9b0e-fe0a13293948)


> **Note:**  
> The above infrastructure diagram illustrates a same-region VPC peering setup. However, this module supports creating VPC peering connections across multiple regions and even across different AWS accounts.



## Providers

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2   |
| <a name="terraform_module"></a> [Terraform](Terraform\module) | >= 1.12.1|

## Usage

```hcl

module "vpc_peering" {
  source = "../"

  requester_vpc_id             = var.requester_vpc_id
  acceptor_vpc_id              = var.acceptor_vpc_id

  requester_vpc_cidr           = var.requester_vpc_cidr
  acceptor_vpc_cidr            = var.acceptor_vpc_cidr

  requester_route_table_ids    = var.requester_route_table_ids
  acceptor_route_table_ids     = var.acceptor_route_table_ids

  requester_region             = var.requester_region
  acceptor_region              = var.acceptor_region

  peer_owner_id                = var.peer_owner_id

  vpc_peering_connection_requester_name = var.vpc_peering_connection_requester_name
  vpc_peering_connection_acceptor_name  = var.vpc_peering_connection_acceptor_name

  providers = {
    aws.requester = aws.requester
    aws.acceptor  = aws.acceptor
  }
}


```
> **Note:**  
> The above example demonstrates how to use the module. All variables, resources, and outputs used here are already defined within this module.

> **Related Module:**  
> If you're looking for a production-ready VPC setup with best practices (CIDR structure, subnets, route tables, flow logs, tagging, etc.), check out our  
> [Terraform AWS Network Skeleton](https://github.com/OT-CLOUD-KIT/terraform-aws-network-skeleton)


## Resources

| Name | Type |
|------|------|
| [aws_vpc_peering_connection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [aws_vpc_peering_connection_accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [aws_route.requester_to_acceptor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.acceptor_to_requester](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_requester_vpc_id"></a> [requester\_vpc\_id](#input\_requester\_vpc\_id) | VPC ID of the requester (the VPC initiating the peering request) | `string` | n/a | yes |
| <a name="input_acceptor_vpc_id"></a> [acceptor\_vpc\_id](#input\_acceptor\_vpc\_id) | VPC ID of the acceptor (the VPC accepting the peering request) | `string` | n/a | yes |
| <a name="input_requester_vpc_cidr"></a> [requester\_vpc\_cidr](#input\_requester\_vpc\_cidr) | The CIDR block of the requester VPC | `string` | n/a | yes |
| <a name="input_acceptor_vpc_cidr"></a> [acceptor\_vpc\_cidr](#input\_acceptor\_vpc\_cidr) | The CIDR block of the acceptor VPC | `string` | n/a | yes |
| <a name="input_requester_route_table_ids"></a> [requester\_route\_table\_ids](#input\_requester\_route\_table\_ids) | Route table IDs for requester VPC (used to add peering routes) | `list(string)` | n/a | yes |
| <a name="input_acceptor_route_table_ids"></a> [acceptor\_route\_table\_ids](#input\_acceptor\_route\_table\_ids) | Route table IDs for acceptor VPC (used to add peering routes) | `list(string)` | n/a | yes |
| <a name="input_requester_region"></a> [requester\_region](#input\_requester\_region) | AWS region of the requester VPC | `string` | n/a | yes |
| <a name="input_acceptor_region"></a> [acceptor\_region](#input\_acceptor\_region) | AWS region of the acceptor VPC | `string` | n/a | yes |
| <a name="input_peer_owner_id"></a> [peer\_owner\_id](#input\_peer\_owner\_id) | For cross-account VPC peering, set the acceptor's AWS account ID | `string` | `""` | no |
| <a name="input_vpc_peering_connection_requester_name"></a> [vpc\_peering\_connection\_requester\_name](#input\_vpc\_peering\_connection\_requester\_name) | Name of the requester VPC peering connection | `string` | n/a | yes |
| <a name="input_vpc_peering_connection_acceptor_name"></a> [vpc\_peering\_connection\_acceptor\_name](#input\_vpc\_peering\_connection\_acceptor\_name) | Name of the acceptor VPC peering connection | `string` | n/a | yes |

---

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_peering_connection_id"></a> [vpc\_peering\_connection\_id](#output\_vpc\_peering\_connection\_id) | The ID of the VPC Peering Connection |
| <a name="output_requester_routes"></a> [requester\_routes](#output\_requester\_routes) | Route IDs from requester to acceptor |
| <a name="output_acceptor_routes"></a> [acceptor\_routes](#output\_acceptor\_routes) | Route IDs from acceptor to requester |


## Contributor

- Piyush Upadhyay
- Nikita Joshi

