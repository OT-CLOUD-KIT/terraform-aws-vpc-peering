## Terraform AWS VPC Peering

A Terraform module to create secure and configurable VPC peering connections across the same or different AWS accounts and regions, including automatic route table updates.
## Architecture

(![image](https://github.com/user-attachments/assets/f1e5ab28-8706-4a0f-84f9-328ed5cbc1ca)


## Providers

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2   |

## Usage

```hcl
provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "peer"
  region = var.acceptor_region
}

module "vpc_peering" {
  source = "./Module"

  name                      = var.name
  create_vpcs               = var.create_vpcs
  requester_vpc_cidr        = var.requester_vpc_cidr
  acceptor_vpc_cidr         = var.acceptor_vpc_cidr
  requester_vpc_id          = var.requester_vpc_id
  acceptor_vpc_id           = var.acceptor_vpc_id
  requester_route_table_ids = var.requester_route_table_ids
  acceptor_route_table_ids  = var.acceptor_route_table_ids
  peer_owner_id             = var.peer_owner_id
  acceptor_region           = var.acceptor_region
  auto_accept               = var.auto_accept

  providers = {
    aws.requester = aws
    aws.acceptor  = aws.peer
  }
}

```

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


---

## Outputs

| Name                                                                                                                                       | Description                                                     |
|--------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| <a name="output_vpc_peering_connection_id"></a> [vpc_peering_connection_id](#output_vpc_peering_connection_id)                             | The ID of the VPC peering connection                            |
| <a name="output_requester_vpc_id"></a> [requester_vpc_id](#output_requester_vpc_id)                                                         | The VPC ID of the requester                                     |
| <a name="output_acceptor_vpc_id"></a> [acceptor_vpc_id](#output_acceptor_vpc_id)                                                            | The VPC ID of the acceptor                                      |


---
