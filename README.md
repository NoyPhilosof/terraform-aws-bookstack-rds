# Terraform Infrastructure - Lesson 9

## Overview
This Terraform script sets up a basic AWS infrastructure for a web application. It includes a **Virtual Private Cloud (VPC)**, **subnets**, an **internet gateway**, **security groups**, a **load balancer**, an **RDS database instance**, and **autoscaling** for high availability.

## Components
- **VPC (Virtual Private Cloud)**: Custom private cloud in AWS with the CIDR block `10.0.0.0/16`.
- **Internet Gateway**: Connects the VPC to the internet.
- **Subnets**: Two subnets (`10.0.1.0/24`, `10.0.3.0/24`) in different availability zones for redundancy.
- **Security Groups**: Configured for HTTP, SSH, and MySQL access.
- **Route Table**: Routes traffic from the subnets to the internet gateway.
- **Load Balancer**: Distributes incoming traffic across multiple targets in different subnets.
- **RDS Instance**: MySQL database instance for data storage.
- **Autoscaling**: Ensures one instance is always running and scales based on CPU utilization.
- **Launch Template**: Template for EC2 instances with a specific AMI, instance type, and initial script.
- **CloudWatch Alarms**: Monitors CPU usage and triggers autoscaling.

## Functionality
- Facilitates a web application with a **load balancer** and **autoscaling**.
- Manages data storage with an **RDS MySQL** instance.
- Ensures **high availability** and **fault tolerance** through multiple subnets and autoscaling.
