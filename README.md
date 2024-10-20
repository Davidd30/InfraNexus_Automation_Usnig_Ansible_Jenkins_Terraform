# InfraNexus_Automation_Usnig_Ansible_Jenkins_Terraform
## Overview

This project automates infrastructure deployment using **Ansible**, **Jenkins**, and **Terraform** to install and configure a Nexus Repository Manager. It handles provisioning, configuration management, and CI/CD processes to support infrastructure as code (IaC) practices.

## Tools Used
- **Ansible**: Configuration management and automation.
- **Jenkins**: CI/CD pipeline automation.
- **Terraform**: Infrastructure provisioning.
  
## Project Structure
- **Ansible**: Contains playbooks for automating configuration tasks.
- **Terraform**: Scripts for provisioning cloud resources.
- **Jenkinsfile**: CI/CD pipeline configuration.

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/Davidd30/InfraNexus_Automation_Usnig_Ansible_Jenkins_Terraform.git
   ```
   
2. Install dependencies:
   - Ansible
   - Terraform
   - Jenkins
   - Docker

3. Configure the necessary variables in Terraform and Ansible files.

## Usage

1. **Provision Infrastructure**:
   Navigate to the Terraform directory and run the following commands:
   ```bash
   terraform init
   terraform apply
   ```

2. **Deploy Configurations**:
   Use Ansible playbooks to configure the provisioned resources:
   ```bash
   ansible-playbook Main_playbook.yaml
   ```

3. **Run Jenkins CI/CD Pipeline**:
   Add the Jenkinsfile to your Jenkins project for pipeline automation.