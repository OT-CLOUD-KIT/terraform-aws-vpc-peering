requester_vpc_id  = "vpc-0d76a177b1c5df301"  # VPC ID of the requester (the VPC initiating the peering request)


acceptor_vpc_id   = "vpc-0bfa15004ff55e107" # VPC ID of the acceptor (the VPC accepting the peering request)


requester_vpc_cidr = "10.1.0.0/16"

acceptor_vpc_cidr  = "172.31.0.0/16"

requester_route_table_ids = ["rtb-0bba85668091331a0"]  # Route table IDs associated with the requester VPC (used to add peering routes)

acceptor_route_table_ids  = ["rtb-0f05d6fd762bf3a45"]  # Route table IDs associated with the acceptor VPC (used to add peering routes)


requester_region = "us-east-1"
acceptor_region  = "us-east-1" # Change if cross-region

peer_owner_id = "" ## For cross-account VPC peering, set the acceptor's AWS account ID

################# Naming Convension #####################

random_alphanumeric_len = 4

bu       = "peer"
app      = "app"
env      = "d"
resource = "vpcPeering"
tenant   = ""

special = false
upper   = false
number  = true

gen_no_of_names = 1

team    = "team1"
program = "ot-cloud-kit"
