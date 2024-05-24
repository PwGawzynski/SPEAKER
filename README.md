

# SPEAKER 🎤

Welcome to the **SPEAKER** project! This repository contains the code and configurations for deploying a highly available, scalable, and secure infrastructure using Terraform. Below, you'll find an overview of the project, the technologies used, and how to get started.

## Table of Contents 📚
- [About the Project](#about-the-project)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Special Feature](#special-feature)

## About the Project 📝
The **SPEAKER** project aims to create a robust infrastructure setup using Terraform. The primary focus is on ensuring scalability, high availability, and security. The project is organized into various modules to enhance modularity and reusability of the code.

### Modules
- **API Gateway Module**: Configures AWS API Gateway.
- **Lambda Handler Module**: Configures the Lambda responsible for connecting with AWS Polly.

### AWS Polly Integration
The project utilizes AWS Polly to generate speech from the provided text, showcasing the text-to-speech capabilities within the Lambda Handler module.

## Technologies Used 🚀
- **Terraform**: Infrastructure as Code (IaC) tool used to define and provision the infrastructure.
- **Python**: For any auxiliary scripts that support the infrastructure setup.
- **HCL (HashiCorp Configuration Language)**: The language used by Terraform to describe the infrastructure resources.

## Getting Started 💻
To get a local copy up and running, follow these steps:

### Prerequisites
- **Terraform**: [Install Terraform](https://www.terraform.io/downloads.html)
- **Python**: [Install Python](https://www.python.org/downloads/)

### Installation
1. Clone the repository:
    ```sh
    git clone https://github.com/PwGawzynski/SPEAKER.git
    cd SPEAKER
    ```
2. Initialize Terraform:
    ```sh
    terraform init
    ```
3. Apply the Terraform configuration:
    ```sh
    terraform apply
    ```

### Configuration
You can use the default configuration or override variables by creating a `Terraform.tfvars` file.

## Special Feature 🌟
One of the unique aspects of this project is the demonstration of directly sending `multipart/form-data` to AWS Lambda. This is not a common practice due to the complexity involved, especially when the `aws_api_gateway_integration` type is set to `AWS` instead of `AWS_PROXY`. However, this project showcases that it is indeed possible.

### Why Not S3?
While using S3 would be a more straightforward and optimal solution for handling file uploads, this project aims to illustrate that direct multipart uploads to Lambda are feasible. This demonstrates flexibility and pushes the boundaries of typical AWS usage.

---

Feel free to explore and provide feedback. Happy coding! 🎉
