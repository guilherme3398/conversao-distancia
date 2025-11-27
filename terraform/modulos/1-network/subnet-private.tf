resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "${data.aws_region.current.name}a"
  
  tags = merge(
    var.tags,
    {
      Name                     = "devops-priv-subnet-1a"
      "kubernetes.io/role/internal-elb" = 1
      #"kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }
  )
}

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "${data.aws_region.current.name}b"
  
  tags = merge(
    var.tags,
    {
      Name                     = "devops-priv-subnet-1b"
      "kubernetes.io/role/internal-elb" = 1
      #"kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }
  )
}

#Associando Route Table Private

resource "aws_route_table_association" "eks_rtb_assoc_priv_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_1a.id
  route_table_id = aws_route_table.eks_private_route_table_1a.id
}

resource "aws_route_table_association" "eks_rtb_assoc_priv_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_1b.id
  route_table_id = aws_route_table.eks_private_route_table_1b.id
}

