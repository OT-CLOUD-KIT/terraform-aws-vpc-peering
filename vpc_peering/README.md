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

| Name                                       | Type         |
|--------------------------------------------|--------------|
| `aws_vpc_peering_connection.peer`          | Resource     |
| `aws_vpc_peering_connection_accepter.peer` | Resource     |
| `aws_route.requester_to_acceptor`          | Resource     |
| `aws_route.acceptor_to_requester`          | Resource     |
| `aws_caller_identity.requester`            | Data Source  |
| `aws_caller_identity.peer`                 | Data Source  |

---
## Inputs


---

## Outputs

| Name                     | Description                                 |
|--------------------------|---------------------------------------------|
| `vpc_peering_connection_id` | The ID of the VPC peering connection     |
| `requester_vpc_id`       | The VPC ID of the requester                 |
| `acceptor_vpc_id`        | The VPC ID of the acceptor                  |

---
