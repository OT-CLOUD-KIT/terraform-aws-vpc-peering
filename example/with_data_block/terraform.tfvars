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

random_alphanumeric_len = 4

bu       = "ot"
app      = "bp"
env      = "d"
resource = "vpcPeering"
tenant   = ""

special = false
upper   = false
number  = true

gen_no_of_names = 1

team    = "infra"
program = "ot-cloud-kit"
