terrenv_name           = "awstest"
region             = "ap-northeast-2"
availability_zones = ["ap-northeast-2a","ap-northeast-2b","ap-northeast-2c"]
##ops_manager_ami    = "ami-051194987fb2e1370"
ops_manager_ami    = ""
dns_suffix         = "pcfdemo.net"
vpc_cidr           = "10.0.0.0/16"
use_route53        = true
use_ssh_routes     = true
use_tcp_routes     = false
rds_instance_count = 1
rds_db_username = "awstestdb"
tags = {
    Project = "awstest"
}