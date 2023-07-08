data "aws_ssm_parameter" "cidr_block" {
  name = "/aft/account-request/custom-fields/cidr"
}

resource "aws_vpc" "main" {
 cidr_block = data.aws_ssm_parameter.cidr_block.value
 
 tags = {
   Name = "sandbox VPC"
 }
}

resource "aws_subnet" "sub01" {
  vpc_id     = "${aws_vpc.main.id}"
  # 10.1.0.0/21
  cidr_block = "${cidrsubnet(data.aws_ssm_parameter.cidr_block.value, 3, 1)}"
  tags {
    Name = "01"
  }
}
resource "aws_subnet" "sub02" {
  vpc_id     = "${aws_vpc.main.id}"
  # 10.1.0.0/21
  cidr_block = "${cidrsubnet(data.aws_ssm_parameter.cidr_block.value, 3, 2)}"
  tags {
    Name = "02"
  }
}