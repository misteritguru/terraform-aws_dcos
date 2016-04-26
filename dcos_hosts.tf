resource "aws_instance" "dcos_bootstrap" {
    ami = "${var.rhel_ami}"
    availability_zone = "${var.az}"
    instance_type = "t2.large"
    key_name = "${var.aws_key_name}"
    security_groups = [ "${var.ssh_access_sg}" ]
    subnet_id = "${var.subnet-private}"
    associate_public_ip_address = false
    source_dest_check = false
    
    tags {
        Name = "dcos_bootstrap"
    }
    connection {
      user = "ec2-user"
      key_file = "${var.aws_key_path}"
    }
    provisioner "remote-exec" {
      inline = [
      "sudo yum install git -y",
      "mkdir -p ~/cookbooks/ctt_dcos",
      "git clone https://github.com/christianTragesser/cookbook-ctt_dcos.git ~/cookbooks/ctt_dcos",
      "cd ~/cookbooks/ctt_dcos && berks install",
      "cd ~/cookbooks/ctt_dcos && berks vendor ~/cookbooks",
      "sudo chef-client -z -o ctt_dcos::bootstrap",
      "sudo sed -i -e 's/MASTER0/${aws_instance.dcos_master0.private_ip}/' -e 's/AGENT0/${aws_instance.dcos_agent0.private_ip}/' -e 's/AGENT1/${aws_instance.dcos_agent1.private_ip}/' -e 's/AGENT2/${aws_instance.dcos_agent2.private_ip}/' /root/genconf/config.yaml"
      ]
    }
}
resource "aws_instance" "dcos_master0" {
    ami = "${var.rhel_ami}"
    availability_zone = "${var.az}"
    instance_type = "t2.large"
    key_name = "${var.aws_key_name}"
    security_groups = [ "${var.ssh_access_sg}", "${aws_security_group.mesos_server.id}" ]
    subnet_id = "${var.subnet-public}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "dcos_master0"
    }
    connection {
      user = "ec2-user"
      key_file = "${var.aws_key_path}"
    }
    provisioner "remote-exec" {
      inline = [
      "sudo yum install git -y",
      "mkdir -p ~/cookbooks/ctt_dcos",
      "git clone https://github.com/christianTragesser/cookbook-ctt_dcos.git ~/cookbooks/ctt_dcos",
      "cd ~/cookbooks/ctt_dcos && berks install",
      "cd ~/cookbooks/ctt_dcos && berks vendor ~/cookbooks",
      "sudo chef-client -z -o ctt_dcos::default"
      ]
    }
}
resource "aws_instance" "dcos_agent0" {
    ami = "${var.rhel_ami}"
    availability_zone = "${var.az}"
    instance_type = "t2.large"
    key_name = "${var.aws_key_name}"
    security_groups = [ "${var.ssh_access_sg}", "${aws_security_group.mesos_server.id}" ]
    subnet_id = "${var.subnet-private}"
    associate_public_ip_address = false
    source_dest_check = false
    
    tags {
        Name = "dcos_agent0"
    }
    connection {
      user = "ec2-user"
      key_file = "${var.aws_key_path}"
    }
    provisioner "remote-exec" {
      inline = [
      "sudo yum install git -y",
      "mkdir -p ~/cookbooks/ctt_dcos",
      "git clone https://github.com/christianTragesser/cookbook-ctt_dcos.git ~/cookbooks/ctt_dcos",
      "cd ~/cookbooks/ctt_dcos && berks install",
      "cd ~/cookbooks/ctt_dcos && berks vendor ~/cookbooks",
      "sudo chef-client -z -o ctt_dcos::default"
      ]
    }
}
resource "aws_instance" "dcos_agent1" {
    ami = "${var.rhel_ami}"
    availability_zone = "${var.az}"
    instance_type = "t2.large"
    key_name = "${var.aws_key_name}"
    security_groups = [ "${var.ssh_access_sg}", "${aws_security_group.mesos_server.id}" ]
    subnet_id = "${var.subnet-private}"
    associate_public_ip_address = false
    source_dest_check = false
    
    tags {
        Name = "dcos_agent1"
    }
    connection {
      user = "ec2-user"
      key_file = "${var.aws_key_path}"
    }
    provisioner "remote-exec" {
      inline = [
      "sudo yum install git -y",
      "mkdir -p ~/cookbooks/ctt_dcos",
      "git clone https://github.com/christianTragesser/cookbook-ctt_dcos.git ~/cookbooks/ctt_dcos",
      "cd ~/cookbooks/ctt_dcos && berks install",
      "cd ~/cookbooks/ctt_dcos && berks vendor ~/cookbooks",
      "sudo chef-client -z -o ctt_dcos::default"
      ]
    }
}
resource "aws_instance" "dcos_agent2" {
    ami = "${var.rhel_ami}"
    availability_zone = "${var.az}"
    instance_type = "t2.large"
    key_name = "${var.aws_key_name}"
    security_groups = [ "${var.ssh_access_sg}", "${aws_security_group.mesos_server.id}" ]
    subnet_id = "${var.subnet-private}"
    associate_public_ip_address = false
    source_dest_check = false
    
    tags {
        Name = "dcos_agent2"
    }
    connection {
      user = "ec2-user"
      key_file = "${var.aws_key_path}"
    }
    provisioner "remote-exec" {
      inline = [
      "sudo yum install git -y",
      "mkdir -p ~/cookbooks/ctt_dcos",
      "git clone https://github.com/christianTragesser/cookbook-ctt_dcos.git ~/cookbooks/ctt_dcos",
      "cd ~/cookbooks/ctt_dcos && berks install",
      "cd ~/cookbooks/ctt_dcos && berks vendor ~/cookbooks",
      "sudo chef-client -z -o ctt_dcos::default"
      ]
    }
}
