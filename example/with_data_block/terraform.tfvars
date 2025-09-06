requester_state_bucket = "ot-cloud-kit-bucket"
requester_state_key    = "ot/module/networkskeleton/terraform.tfstate"
requester_state_region = "us-east-1"

acceptor_vpc_name        = "vpc-A"
acceptor_public_rt_name  = "public-rt-1"
acceptor_private_rt_name = "" # ← use empty string, not null
acceptor_main_rt_name    = "" # ← use empty string, not null

requester_region = "us-east-1"
acceptor_region  = "us-east-1"




################## Naming Convension #####################

env = "dev"
owner = "Opstree"
app = "otcloud kit"
