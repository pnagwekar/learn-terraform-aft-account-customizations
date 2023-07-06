data "aws_ssm_parameter" "cidr_block" {
  name = "/aft/account-request/custom-fields/cidr"
}

resource "aws_vpc" "main" {
 cidr_block = ${data.aws_ssm_parameter.cidr_block}
 
 tags = {
   Name = "sandbox VPC"
 }
}