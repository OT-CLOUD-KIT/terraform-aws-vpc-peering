## Terraform AWS VPC Peering

A Terraform module to create secure and configurable VPC peering connections across the same or different AWS accounts and regions, including automatic route table updates.
## Architecture

![new_peer drawio](https://github.com/user-attachments/assets/76431267-5fef-41a1-bbb5-69da06a1464d)


> **Note:**  
> The above infrastructure diagram illustrates a same-region VPC peering setup. However, this module supports creating VPC peering connections across multiple regions and even across different AWS accounts.

## Providers
| Name | Version |
|------|---------|
|Terraform |  >= 1.12.1|
|aws | 5.82.2 |


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

## Resources

| Name                                                                                                   | Type        |
|--------------------------------------------------------------------------------------------------------|-------------|
| <a name="resource_aws_vpc_peering_connection_peer"></a> [aws_vpc_peering_connection.peer](#resource_aws_vpc_peering_connection_peer)                   | Resource     |
| <a name="resource_aws_vpc_peering_connection_accepter_peer"></a> [aws_vpc_peering_connection_accepter.peer](#resource_aws_vpc_peering_connection_accepter_peer) | Resource     |
| <a name="resource_aws_route_requester_to_acceptor"></a> [aws_route.requester_to_acceptor](#resource_aws_route_requester_to_acceptor)                   | Resource     |
| <a name="resource_aws_route_acceptor_to_requester"></a> [aws_route.acceptor_to_requester](#resource_aws_route_acceptor_to_requester)                   | Resource     |
| <a name="data_aws_caller_identity_requester"></a> [aws_caller_identity.requester](#data_aws_caller_identity_requester)                                 | Data Source  |
| <a name="data_aws_caller_identity_peer"></a> [aws_caller_identity.peer](#data_aws_caller_identity_peer)                                               | Data Source  |

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| requester_region | The region of the requester VPC. | `string` | `us-east-1` | yes |
| accepter_region | The region of the accepter VPC. | `string` | `us-east-1` | yes |
| requester_vpc_cidr | The CIDR of the requester VPC. | `string` | `10.0.0.0/16` | yes |
| accepter_vpc_cidr | The CIDR of the accepter VPC. | `string` | `172.31.0.0/16` | yes |
| vpc_peering_connection_requester_name | The NAME of the requester VPC peering connection. | `string` | `requester` | yes |
| vpc_peering_connection_accepter_name | The NAME of the accepter VPC peering connection. | `string` | `accepter` | yes 

---

## Outputs

| Name                                                                                                                                       | Description                                                     |
|--------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| <a name="output_vpc_peering_connection_id"></a> [vpc_peering_connection_id](#output_vpc_peering_connection_id)                             | The ID of the VPC peering connection                            |
| <a name="output_requester_vpc_id"></a> [requester_vpc_id](#output_requester_vpc_id)                                                         | The VPC ID of the requester                                     |
| <a name="output_acceptor_vpc_id"></a> [acceptor_vpc_id](#output_acceptor_vpc_id)                                                            | The VPC ID of the acceptor                                      |


---

## Contributor

- Piyush Upadhyay
- Nikita Joshi

