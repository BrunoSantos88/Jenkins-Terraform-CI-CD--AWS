#module "networking" {
 # source       = "./networking"
 # vpc_cidr     = "192.0.0.0/16"
 # public_cidrs = ["192.0.1.0/24", "192.0.2.0/24"]
#}

#module "compute" {
 # source       = "./compute"
#}

module "networking" {
source        = "./eksnetworking"

}