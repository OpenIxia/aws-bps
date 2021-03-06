provider "aws" {
	region = var.Region
}

locals {
	uuid = substr(uuid(), 1, 6)
	Region = var.Region
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	BPSSCInstanceType = var.BPSSCInstanceType
	BPSvBladeInstanceType = var.BPSvBladeInstanceType
	InboundIPv4CidrBlock = var.InboundIPv4CidrBlock
	AMIxSYSCTRL = {
		us-east-1 = "ami-03b1e9364039636db"
		us-east-2 = "ami-021648e4eb6760d51"
		us-west-1 = "ami-0b46b8ac3f85385fc"
		us-west-2 = "ami-047a23b9a8a668f24"
		ap-east-1 = "ami-00000000000000000"
		ap-south-1 = "ami-08f84cd771f87fffc"
		ap-northeast-2 = "ami-0548a2d5a782beab9"
		ap-southeast-1 = "ami-05e9bf1ba430daf0f"
		ap-southeast-2 = "ami-03fbfb58510bcc4b0"
		ap-northeast-1 = "ami-03600987a4422eeb2"
		ca-central-1 = "ami-0037e1731d1a2c7e0"
		eu-central-1 = "ami-05c0c681e93648daa"
		eu-west-1 = "ami-0807c23561b368c95"
		eu-west-2 = "ami-0be2fb4384c6cb237"
		eu-west-3 = "ami-07840834b3250076f"
		eu-north-1 = "ami-0fe05a1497ad02766"
		me-south-1 = "ami-00000000000000000"
		sa-east-1 = "ami-01048ab4ca1799ac9"
	}
	AMIxVBLADE = {
		us-east-1 = "ami-052f9f953b6ea1267"
		us-east-2 = "ami-0278b164d4f64e5d0"
		us-west-1 = "ami-061e834f111cfba32"
		us-west-2 = "ami-09a14ef74ddddb92b"
		ap-east-1 = "ami-00000000000000000"
		ap-south-1 = "ami-0ba041828e0b0dd41"
		ap-northeast-2 = "ami-085fbadd652e6f030"
		ap-southeast-1 = "ami-0f2f0b295ce2e30ec"
		ap-southeast-2 = "ami-0c76e7186b3551155"
		ap-northeast-1 = "ami-01a5b47008d5f6f52"
		ca-central-1 = "ami-06209ac8e4960f2a6"
		eu-central-1 = "ami-0b63ff3e157ee0b90"
		eu-west-1 = "ami-028a2495096983cc4"
		eu-west-2 = "ami-048e7c436085e150d"
		eu-west-3 = "ami-08b6576959850501b"
		eu-north-1 = "ami-0bf143d947c1d60b3"
		me-south-1 = "ami-00000000000000000"
		sa-east-1 = "ami-022a36d8d9104fb38"
	}
	EC2xCONNECTxCIDR = {
		us-east-1 = "18.206.107.24/29"
		us-east-2 = "3.16.146.0/29"
		us-west-1 = "13.52.6.112/29"
		us-west-2 = "18.237.140.160/29"
		ap-east-1 = "18.206.107.24/29"
		ap-south-1 = "13.233.177.0/29"
		ap-northeast-2 = "13.209.1.56/29"
		ap-southeast-1 = "3.0.5.32/29"
		ap-southeast-2 = "13.239.158.0/29"
		ap-northeast-1 = "3.112.23.0/29"
		ca-central-1 = "35.183.92.176/29"
		eu-central-1 = "3.120.181.40/29"
		eu-west-1 = "18.202.216.48/29"
		eu-west-2 = "3.8.37.24/29"
		eu-west-3 = "35.180.112.80/29"
		eu-north-1 = "13.48.4.200/30"
		me-south-1 = "18.206.107.24/29"
		sa-east-1 = "13.48.4.200/30"
	}
	EC2xREGION = {
		us-east-1 = "US East (N. Virginia)"
		us-east-2 = "US East (Ohio)"
		us-west-1 = "US West (N. California)"
		us-west-2 = "US West (Oregon)"
		ap-east-1 = "Asia Pacific (Hong Kong)"
		ap-south-1 = "Asia Pacific (Mumbai)"
		ap-northeast-2 = "Asia Pacific (Seoul)"
		ap-southeast-1 = "Asia Pacific (Singapore)"
		ap-southeast-2 = "Asia Pacific (Sydney)"
		ap-northeast-1 = "Asia Pacific (Tokyo)"
		ca-central-1 = "Canada (Central)"
		eu-central-1 = "EU (Frankfurt)"
		eu-west-1 = "EU (Ireland)"
		eu-west-2 = "EU (London)"
		eu-west-3 = "EU (Paris)"
		eu-north-1 = "EU (Stockholm)"
		me-south-1 = "Middle East (Bahrain)"
		sa-east-1 = "South America (Sao Paulo)"
	}
	REGIONxTAG = {
		us-east-1 = "US_EAST_1"
		us-east-2 = "US_EAST_2"
		us-west-1 = "US_WEST_1"
		us-west-2 = "US_WEST_2"
		ap-east-1 = "AP_EAST_1"
		ap-south-1 = "AP_SOUTH_1"
		ap-northeast-2 = "AP_NORTHEAST_2"
		ap-southeast-1 = "AP_SOUTHEAST_1"
		ap-southeast-2 = "AP_SOUTHEAST_2"
		ap-northeast-1 = "AP_NORTHEAST_1"
		ca-central-1 = "CA_CENTRAL_1"
		eu-central-1 = "EU_CENTRAL_1"
		eu-west-1 = "EU_WEST_1"
		eu-west-2 = "EU_WEST_2"
		eu-west-3 = "EU_WEST_3"
		eu-north-1 = "EU_NORTH_1"
		me-south-1 = "ME_SOUTH_1"
		sa-east-1 = "SA_EAST_1"
	}
	OPTIONSxTAG = "MANUAL"
	PROJECTxTAG = "OPEN_IXIA"
	VPCxCIDRxBLOCK = "10.0.0.0/16"
	VPCxINSTANCExTENANCY = "default"
	VPCxENABLExDNSxSUPPORT = true
	VPCxENABLExDNSxHOSTNAMES = true
	PLACEMENTxGROUPxSTRATEGY = "cluster"
	FLOWxLOGxTRAFFICxTYPE = "REJECT"
	SUBNETxAVAILABILITYxZONExINDEX = "0"
	MGMTxSUBNETxCIDRxBLOCK = "10.0.10.0/24"
	CTRLxSUBNETxCIDRxBLOCK = "10.0.1.0/24"
	TEST1xSUBNETxCIDRxBLOCK = "10.0.2.0/24"
	TEST2xSUBNETxCIDRxBLOCK = "10.0.3.0/24"
	INTERFACExSOURCExDESTxCHECK = false
	INSTANCExDISABLExAPIxTERMINATION = false
	INSTANCExMONITORING = false
	INSTANCExINSTANCExINITIATEDxSHUTDOWNxBEHAVIOR = "stop"
	INSTANCExBLOCKxDEVICExNAME = "/dev/sda1"
	INSTANCExEBSxDELETExONxTERMINATION = true
	INSTANCExEBSxVOLUMExTYPE = "gp2"
	APPxTAG = "BPS"
	APPxVERSION = "9.10U2"
	SYSCTRLxCTRL0xPRIVATExIPxADDRESS = "10.0.1.10"
	SYSCTRLxIMGxSIZE = "100"
	VBLADE1xETH0xPRIVATExIPxADDRESS = "10.0.1.11"
	VBLADE1xETH1xPRIVATExIPxADDRESSES = [ "10.0.2.12", "10.0.2.13", "10.0.2.14", "10.0.2.15", "10.0.2.16", "10.0.2.17", "10.0.2.18", "10.0.2.19", "10.0.2.20", "10.0.2.21" ]
	VBLADE1xETH2xPRIVATExIPxADDRESSES = [ "10.0.3.12", "10.0.3.13", "10.0.3.14", "10.0.3.15", "10.0.3.16", "10.0.3.17", "10.0.3.18", "10.0.3.19", "10.0.3.20", "10.0.3.21" ]
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_placement_group" "PlacementGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_PLACEMENT_GROUP_${local.uuid}_${local.REGIONxTAG["${local.Region}"]}"
	strategy = local.PLACEMENTxGROUPxSTRATEGY
}

resource "aws_vpc" "Vpc" {
	cidr_block = local.VPCxCIDRxBLOCK
	instance_tenancy = local.VPCxINSTANCExTENANCY
	enable_dns_support = local.VPCxENABLExDNSxSUPPORT
	enable_dns_hostnames = local.VPCxENABLExDNSxHOSTNAMES
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_VPC_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_flow_log" "VpcFlowLog" {
	log_destination =  aws_cloudwatch_log_group.VpcFlowLogGroup.arn
	iam_role_arn = aws_iam_role.VPCFlowLogAccessRole.arn
	vpc_id = aws_vpc.Vpc.id
	traffic_type = local.FLOWxLOGxTRAFFICxTYPE
}

resource "aws_iam_role" "VPCFlowLogAccessRole" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_VPC_FLOW_LOG_ACCESS_ROLE_${local.uuid}_${local.REGIONxTAG["${local.Region}"]}"
	assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": "sts:AssumeRole",
			"Principal": {
				"Service": "vpc-flow-logs.amazonaws.com"
			},
			"Effect": "Allow"
		}
	]
}
EOF
	permissions_boundary = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
	path = "/"
}

resource "aws_cloudwatch_log_group" "VpcFlowLogGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_VPC_FLOW_LOG_GROUP_${local.uuid}_${local.REGIONxTAG["${local.Region}"]}"
}

resource "aws_subnet" "MgmtSubnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.MGMTxSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_SUBNET_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_subnet" "CtrlSubnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.CTRLxSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_CTRL_SUBNET_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_subnet" "Test1Subnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.TEST1xSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_SUBNET_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_subnet" "Test2Subnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.TEST2xSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST2_SUBNET_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_security_group" "MgmtSecurityGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_security_group_rule" "MgmtIngress22" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "tcp"
	from_port = 22
	to_port = 22
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress80" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "tcp"
	from_port = 80
	to_port = 80
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress443" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "tcp"
	from_port = 443
	to_port = 443
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress8880" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "tcp"
	from_port = 8880
	to_port = 8880
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtEgress1" {
	type = "egress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "-1"
	to_port = 0
	from_port = 0
	cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group" "CtrlSecurityGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_CTRL_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_CTRL_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_security_group_rule" "CtrlIngress1" {
	type = "ingress"
	security_group_id = aws_security_group.CtrlSecurityGroup.id
	protocol = "-1"
	from_port = 0
	to_port = 0
	source_security_group_id = aws_security_group.CtrlSecurityGroup.id
}

resource "aws_security_group_rule" "CtrlIngress2" {
	type = "ingress"
	security_group_id = aws_security_group.CtrlSecurityGroup.id
	protocol = "tcp"
	from_port = 22
	to_port = 22
	cidr_blocks = [ local.EC2xCONNECTxCIDR["${local.Region}"] ]
}

resource "aws_security_group_rule" "CtrlIngress22" {
	type = "ingress"
	security_group_id = aws_security_group.CtrlSecurityGroup.id
	protocol = "tcp"
	from_port = 22
	to_port = 22
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "CtrlEgress1" {
	type = "egress"
	security_group_id = aws_security_group.CtrlSecurityGroup.id
	protocol = "-1"
	to_port = 0
	from_port = 0
	cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group" "Test1SecurityGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_security_group_rule" "Test1Ingress1" {
	type = "ingress"
	security_group_id = aws_security_group.Test1SecurityGroup.id
	protocol = "-1"
	from_port = 0
	to_port = 0
	source_security_group_id = aws_security_group.Test1SecurityGroup.id
}

resource "aws_security_group_rule" "Test1Egress1" {
	type = "egress"
	security_group_id = aws_security_group.Test1SecurityGroup.id
	protocol = "-1"
	to_port = 0
	from_port = 0
	cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_default_security_group" "DefaultEgress1" {
	vpc_id = aws_vpc.Vpc.id

	egress {
		protocol = -1
		self = true
		from_port = 0
		to_port = 0
	}
}

resource "aws_internet_gateway" "InternetGw" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_INTERNET_GW_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_route" "MgmtRoute" {
	destination_cidr_block = "0.0.0.0/0"
	route_table_id = aws_route_table.MgmtRouteTable.id
	gateway_id = aws_internet_gateway.InternetGw.id
	depends_on = [
		aws_internet_gateway.InternetGw
	]
}

resource "aws_route_table" "MgmtRouteTable" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_ROUTE_TABLE_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_route_table" "CtrlRouteTable" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_CTRL_ROUTE_TABLE_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_route_table" "Test1RouteTable" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_ROUTE_TABLE_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_route_table_association" "MgmtSubnetRouteTableAssociation" {
	route_table_id = aws_route_table.MgmtRouteTable.id
	subnet_id = aws_subnet.MgmtSubnet.id
}

resource "aws_route" "CtrlRoute" {
	destination_cidr_block = "0.0.0.0/0"
	route_table_id = aws_route_table.CtrlRouteTable.id
	gateway_id = aws_internet_gateway.InternetGw.id
	depends_on = [
		aws_internet_gateway.InternetGw
	]
}

resource "aws_route_table_association" "CtrlSubnetRouteTableAssociation" {
	route_table_id = aws_route_table.CtrlRouteTable.id
	subnet_id = aws_subnet.CtrlSubnet.id
}

resource "aws_route_table_association" "Test1SubnetRouteTableAssociation" {
	route_table_id = aws_route_table.Test1RouteTable.id
	subnet_id = aws_subnet.Test1Subnet.id
}

resource "aws_route_table_association" "Test2SubnetRouteTableAssociation" {
	route_table_id = aws_route_table.Test1RouteTable.id
	subnet_id = aws_subnet.Test2Subnet.id
}

resource "aws_network_interface" "BpsSystemControllerEth0" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_SYSTEM_CONTROLLER_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.MgmtSubnet.id
	security_groups = [
		aws_security_group.MgmtSecurityGroup.id
	]
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_SYSTEM_CONTROLLER_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_network_interface" "BpsSystemControllerCtrl0" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_SYSTEM_CONTROLLER_${local.APPxVERSION}_CTRL0_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.CtrlSubnet.id
	security_groups = [
		aws_security_group.CtrlSecurityGroup.id
	]
	private_ips = [ local.SYSCTRLxCTRL0xPRIVATExIPxADDRESS ]
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_SYSTEM_CONTROLLER_${local.APPxVERSION}_CTRL0_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_network_interface" "BpsVirtualBlade1Eth0" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VIRTUAL_BLADE1_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.CtrlSubnet.id
	security_groups = [
		aws_security_group.CtrlSecurityGroup.id
	]
	private_ips = [ local.VBLADE1xETH0xPRIVATExIPxADDRESS ]
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VIRTUAL_BLADE1_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_network_interface" "BpsVirtualBlade1Eth1" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VIRTUAL_BLADE1_${local.APPxVERSION}_ETH1_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.Test1Subnet.id
	security_groups = [
		aws_security_group.Test1SecurityGroup.id
	]
	private_ips = local.VBLADE1xETH1xPRIVATExIPxADDRESSES
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VIRTUAL_BLADE1_${local.APPxVERSION}_ETH1_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_network_interface" "BpsVirtualBlade1Eth2" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VIRTUAL_BLADE1_${local.APPxVERSION}_ETH2_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.Test2Subnet.id
	security_groups = [
		aws_security_group.Test1SecurityGroup.id
	]
	private_ips = local.VBLADE1xETH2xPRIVATExIPxADDRESSES
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VIRTUAL_BLADE1_${local.APPxVERSION}_ETH2_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_instance" "BpsVirtualBlade1" {
	disable_api_termination = local.INSTANCExDISABLExAPIxTERMINATION
	instance_initiated_shutdown_behavior = local.INSTANCExINSTANCExINITIATEDxSHUTDOWNxBEHAVIOR
	ami = local.AMIxVBLADE["${local.Region}"]
	instance_type = local.BPSvBladeInstanceType
	monitoring = local.INSTANCExMONITORING
	placement_group = aws_placement_group.PlacementGroup.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_VIRTUAL_BLADE1_${local.APPxVERSION}_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
	network_interface {
		network_interface_id = aws_network_interface.BpsVirtualBlade1Eth0.id
		device_index = "0"
	}
	network_interface {
		network_interface_id = aws_network_interface.BpsVirtualBlade1Eth1.id
		device_index = "1"
	}
	network_interface {
		network_interface_id = aws_network_interface.BpsVirtualBlade1Eth2.id
		device_index = "2"
	}
	ebs_block_device {
		device_name = local.INSTANCExBLOCKxDEVICExNAME
		delete_on_termination = local.INSTANCExEBSxDELETExONxTERMINATION
		volume_type = local.INSTANCExEBSxVOLUMExTYPE
	}
}

resource "aws_instance" "BpsSystemController" {
	disable_api_termination = local.INSTANCExDISABLExAPIxTERMINATION
	instance_initiated_shutdown_behavior = local.INSTANCExINSTANCExINITIATEDxSHUTDOWNxBEHAVIOR
	ami = local.AMIxSYSCTRL["${local.Region}"]
	instance_type = local.BPSSCInstanceType
	monitoring = local.INSTANCExMONITORING
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_SYSTEM_CONTROLLER_${local.APPxVERSION}_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
	user_data = "BLADE_IPS=(${local.VBLADE1xETH0xPRIVATExIPxADDRESS})"
	network_interface {
		network_interface_id = aws_network_interface.BpsSystemControllerEth0.id
		device_index = "0"
	}
	network_interface {
		network_interface_id = aws_network_interface.BpsSystemControllerCtrl0.id
		device_index = "1"
	}
	ebs_block_device {
		device_name = local.INSTANCExBLOCKxDEVICExNAME
		volume_size = local.SYSCTRLxIMGxSIZE
		delete_on_termination = local.INSTANCExEBSxDELETExONxTERMINATION
		volume_type = local.INSTANCExEBSxVOLUMExTYPE
	}
	depends_on = [
		aws_instance.BpsVirtualBlade1
	]
}

resource "aws_eip" "MgmtElasticIp" {
	vpc = true
	network_interface = aws_network_interface.BpsSystemControllerEth0.id
	depends_on = [
		aws_internet_gateway.InternetGw
	]
}

resource "aws_eip" "CtrlElasticIp" {
	vpc = true
	network_interface = aws_network_interface.BpsSystemControllerCtrl0.id
	depends_on = [
		aws_internet_gateway.InternetGw
	]
}

resource "aws_eip" "BpsVirtualBlade1Eth0ElasticIp" {
	vpc = true
	network_interface = aws_network_interface.BpsVirtualBlade1Eth0.id
	depends_on = [
		aws_internet_gateway.InternetGw,
		aws_instance.BpsVirtualBlade1
	]
}