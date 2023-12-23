# Get RDS id information
data "aws_db_instance" "rds-db" {
  db_instance_identifier = aws_db_instance.rds-db-lesson9.id
}

# Create launch template
resource "aws_launch_template" "lt-lesson9" {
  name_prefix   = "lesson9-launch-template-"
  image_id      = "ami-018ba43095ff50d08"
  instance_type = "t2.micro"
  key_name      = "little-cat-rsa-key"

  user_data = base64encode(<<-EOF
                #!/usr/bin/bash
                yum update -y
                yum install docker -y
                systemctl enable docker
                systemctl start docker
                docker run -d -e DB_HOST=${data.aws_db_instance.rds-db.address}:3306 -e DB_DATABASE=bookstack -e DB_USERNAME=bookstack -e DB_PASSWORD=secret123 -p 8080:80 solidnerd/bookstack:0.27.5
                EOF
              )

  network_interfaces {
    device_index                  = 0
    associate_public_ip_address   = true
    security_groups               = [aws_security_group.sg-lesson9.id]
  }

  lifecycle {
    create_before_destroy = true
  }
}
