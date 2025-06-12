requester_vpc_id  = "vpc-0d76a177b1c5df301"
acceptor_vpc_id   = "vpc-0bfa15004ff55e107"

requester_vpc_cidr = "10.1.0.0/16"
acceptor_vpc_cidr  = "172.31.0.0/16"

requester_route_table_ids = ["rtb-0bba85668091331a0"]
acceptor_route_table_ids  = ["rtb-0f05d6fd762bf3a45"]

requester_region = "us-east-1"
acceptor_region  = "us-east-1" # Change if cross-region

peer_owner_id = "" # leave empty for same-account, set to AWS account ID for cross-account

vpc_peering_connection_requester_name = "peering-requester"
vpc_peering_connection_acceptor_name  = "peering-acceptor"
