resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true # habilitando uso do dns
  enable_dns_hostnames = true # habilitando o uso do hosts na vpc

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-vpc"
    }
  )

}