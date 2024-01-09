# Smart Home Microservices Apps - Terraform

## Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Features](#features)
- [Modules](#modules)
   1. [Autoscaling](#autoscaling)
   2. [Databases](#databases)
   3. [Load Balancing](#load-balancing)
   4. [Networking](#networking)
   5. [Services Servers](#services-servers)
- [Usage](#usage)
- [Customisation](#customisation)


## Overview

This Terraform script automates the provision of  scaleable and secure infrastruce on AWS, specifically tailored for Smart Home Microservice applications. It is designed to provide a foundation for deploying scaleable and secure applications within the AWS cloud environment. 

## Prerequisites 

Before you begin, ensure you have the following prerequisites in place: 

### 1. Terraform Installation

Be sure Terraform is installed on your local machine. If not, you can download and install it from the [official Terraform website](https://www.terraform.io/downloads.html).

To check if Terraform is installed, run the following command in your terminal:

```bash
terraform --version
```
### 2. AWS Credentials Configuration 

You will need AWS credentials configured to your machine - this can be set up using the AWS CLI or by configuring environment variables. 

#### Using AWS CLI
1. Follow these instructions in the [AWS CLI User Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
2. Configure your aws credentials by running this command and providing your AWS acces key, secret key, region and output format.

```bash
aws configure 
```

#### Using Environment Variables 

Alternatively you can use the following envronment varibales:
```bash
AWS_ACCESS_KEY_ID: Your AWS access key.
AWS_SECRET_ACCESS_KEY: Your AWS secret key.
AWS_DEFAULT_REGION: Your preferred AWS region.
AWS_DEFAULT_OUTPUT: (Optional) Your preferred AWS CLI output format (e.g., json).
```
#### 3. Git (Optional)
If you clone this repository, you will need to have Git installed locally. You can download Git from the [official Git website](https://git-scm.com/downloads)

To check if Git is installed, run the following command in your terminal:

```bash
git --version
```

## Features

### 1. **Scalability**

   - Provision a Virtual Private Cloud (VPC) that allows for the seamless scaling of microservices as your application grows.

### 2. **Security**

   - Set up strong security measures by configuring security groups to control inbound and outbound traffic to your microservices.

### 3. **Modularity**

   - Design your infrastructure with modularity in mind. The Terraform scripts are organized into modules, making it easy to customize and extend based on your specific requirements.

### 4. **Infrastructure as Code (IaC)**

   - Embrace Infrastructure as Code principles with Terraform, allowing you to version control your infrastructure and manage changes more effectively.

### 5. **Compatibility**

   - Ensure compatibility with the latest versions of Terraform and AWS services, providing users with a reliable and up-to-date infrastructure provisioning solution.


## Modules

### 1. Networking 
Networking is where the Virtual Private Cloud(VPC) is created with specified configurations to establish and secure isolated network environment. The infrasturce is design to support public and private subnets across multiple Availability Zones. 
#### Variables
- `vpc_name`: The name of the Virtual Private Cloud(VPC).
- `cidr_range`: The CIDR range for the VPC.
- `public_subnets`: A list of the CIDR ranges required for the public subnets.
- `private_subnets`: A list of the CIDR ranges required for the private subnets.
- `azs`: A list of the Availability Zones you wish to provision infrastructure in.
#### Outputs
- `vpc_id`: The ID of the created VPC.
- `public_subnets`: List of IDs of public subnets.
- `private_subnets`: List of IDs of private subnets.

### 2. Security
#### Variables
- `vpc_id`: The ID of the created VPC.
#### Outputs
- `security_group_id`: The id of the created security group.
- `security_groups`: A list of security groups associated with the insfrastuce.

### 3. Services Servers 
Service servers involves the creation of the Amazong Elastic Compute Cloud(EC2) instances to host multiple services. Each EC2 instance is configure with specific parameters. 
#### Variables
- `instance_type`: The type of instance to be applied.
- `service_names`: A list of the different services names to apply to each server.
- `public_subnets`: A list of the CIDR ranges required for the public subnets.
- `private_subnets`: A list of the CIDR ranges required for the private subnets.
- `security_group_id`: The id of the created security group.
- `key_name`: The key_name available to access the servers.
- `ami_img`: A list of the Amazon Machine Images(AMI).
#### Outputs
- `services_servers`: 
- `instance_id`: The id of the instance created. 


### 4. Databases
The Databases module focuses on the creation of DynamboDB databases, configuring each database with a different instance ids to meet specific requirements.
#### Variables
- `database_names`: A list of the names of the DynamoDB database. 

### 5. Load Balancing 
The Load Balncing module is designed to manage the distubution of incoming traffic among Amazon Elastic Compute Cloud (EC2) instances with the Virtual Private Cloud(VPC). This is imperative for enhancing the availability and fault tolerance of the system.
#### Variables
- `vpc_id`: The ID of the created VPC.
- `instance_id`: The id of the instance created. 
- `security_group_id`: The id of the created security group.
- `public_subnets`: A list of the CIDR ranges required for the public subnets.
- `private_subnets`: A list of the CIDR ranges required for the private subnets.
- `path`: A list of the different paths.
- `service_names`: A list of the different services names to apply to each server.
#### Outputs
- `smart_home_tg_arns`:  A list of Amazon Resource Name(ARNs) for the target groups associated with the Smart Home application. 

### 6. Autoscaling
The Autoscaloing module focuses on automatically adjusting the number of Amazon Elastic Compute Cloud (EC2) instances based on demand, to ensure optiomal perfomance. 
#### Variables
- `service_names`: A list of the different services names to apply to each server.
- `ami_img`: A list of the Amazon Machine Images(AMI).
- `instance_type`: The type of instance to be applied.
- `key_name`: The key_name available to access the servers.
- `security_group_id`: The id of the created security group.
- `desired_capacity`: The desired number of instances in the autoscaling group.
- `min_size`: The minimum number of instances in the autoscaling group.
- `max_size`: The maximum number of instances in the autoscaling group.
- `public_subnets_ids`: A list of IDs for the public subnets.


## Usage

## Customisation