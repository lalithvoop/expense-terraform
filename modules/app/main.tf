resource "aws_instance" "instance"{
    ami = data.aws_ami.ami.id
    vpc_security_group_ids = [data.aws_security_group.selected.id]
    instance_type = var.instance_type
    tags = {
        Name = var.component
    }    
} 

resource "null_resource" "ansible"{
    provisioner "remote-exec"{

        connection {
            type = "ssh"
            user = "ec2-user"
            password = "DevOps321"
            host = aws_instance.instance.public_ip
        }

        inline = [
            "sudo pip3 install ansible",
            "ansible-pull -i localhost, -U https://github.com/lalithvoop/ansible-expense expense.yml -e env=${var.env} -e role_name=${var.component}"
        ]
    }
}

resource "aws_route53_record" "record" {
  name    = "${var.component}-${var.env}"
  type    = "A"
  zone_id = var.zone_id
  records = [aws_instance.instance.private_ip]
  ttl     = 30
}