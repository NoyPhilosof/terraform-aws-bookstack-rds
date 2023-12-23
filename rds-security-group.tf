resource "aws_security_group" "rds-sg" {
  name        = "rds-sg-lesson9"
  description = "Security group for RDS instance in Lesson 9"
  vpc_id      = aws_vpc.vpc-lesson9.id
}

resource "aws_security_group_rule" "rds-ingress-from-ec2" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.rds-sg.id
  source_security_group_id = aws_security_group.sg-lesson9.id
}

# Create DB subnet group
resource "aws_db_subnet_group" "rds-subnet-group" {
  name       = "rds_subnet_group"
  subnet_ids = [aws_subnet.use1c-lesson9.id, aws_subnet.use1a-lesson9.id]

  tags = {
    Name = "RDS subnet group"
  }
}
