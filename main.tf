provider "aws" {
    region = "ap-south-1"
}

variable avail_zone {

}


resource "aws_vpc" "development-vpc"{
    cidr_block= "10.0.0.0/16"
    tags = {
        Name = "development"
    }
}

resource "aws_subnet" "dev-subnet-1"{
    vpc_id= aws_vpc.development-vpc.id
    cidr_block="10.0.10.0/24"
    availability_zone =var.avail_zone 
     tags = {
        Name = "subnet-1-dev"
    }
}

data "aws_vpc" "existing_vpc"{
    default = true
}

resource "aws_subnet" "dev-subnet-2"{
    vpc_id= data.aws_vpc.existing_vpc.id
    cidr_block="172.31.48.0/20"
    availability_zone = "ap-south-1a"
     tags = {
        Name = "subnet-2-default"
    }
}
