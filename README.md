# AWS Terraform DevOps Project

End-to-end Infrastructure as Code (IaC) project provisioning a production-style AWS environment using Terraform, with a full CI/CD pipeline (Jenkins + GitHub Actions), automated PR-based infrastructure workflows via Atlantis, and security scanning with Checkov.

## 📌 Overview

This project demonstrates a complete DevOps workflow for managing AWS infrastructure:

- **Infrastructure as Code** — AWS resources (VPC, Subnets, EC2, Load Balancer, Security Groups, IAM) provisioned entirely via Terraform
- **CI/CD Automation** — Terraform fmt, validate, plan, and apply automated through Jenkins and GitHub Actions
- **PR-based Infra Workflow** — Atlantis integration for plan/apply directly from pull requests
- **Security Scanning** — Static analysis of Terraform code using Checkov to catch misconfigurations before deployment

## 🏗️ Architecture

![Architecture Diagram](docs/docs/screenshots/architecture.png.png)

## 📂 Repository Structure

aws-terraform-devops/
├── .github/workflows/     # GitHub Actions CI/CD pipelines
├── terraform/             # Terraform IaC code (VPC, EC2, ALB, IAM, SG)
├── docs/docs/screenshots/ # Setup & pipeline screenshots
├── Jenkinsfile            # Jenkins pipeline definition
├── atlantis.yaml          # Atlantis PR automation config
├── checkov-report.txt     # Initial security scan report
├── checkov-final.txt      # Post-fix security scan report
├── .gitignore
└── LICENSE

## ⚙️ Prerequisites

- AWS Account with configured credentials (aws configure)
- Terraform >= 1.x installed
- Jenkins server (with Terraform, AWS CLI, and Docker installed)
- GitHub repository with Actions enabled
- Atlantis server (optional, for PR-based workflow)
- Checkov installed (pip install checkov)

## 🚀 Getting Started

### 1. Clone the repository
git clone https://github.com/Rakesh62041/aws-terraform-devops.git
cd aws-terraform-devops/terraform

### 2. Initialize Terraform
terraform init

### 3. Format & Validate
terraform fmt
terraform validate

### 4. Review the plan
terraform plan

### 5. Apply
terraform apply

### 6. Destroy (cleanup)
terraform destroy

## 🔐 Security Scanning

This project uses Checkov (https://www.checkov.io/) to scan Terraform code for security misconfigurations before deployment.

checkov -d terraform/

Scan reports are available in:
- checkov-report.txt — initial scan results
- checkov-final.txt — results after fixing flagged issues

## 🔄 CI/CD Pipelines

### Jenkins
The Jenkinsfile defines a pipeline with the following stages:
1. terraform fmt
2. terraform validate
3. terraform plan
4. Manual approval
5. terraform apply

![Jenkins Terraform Pipeline](docs/docs/screenshots/P7-Jenkins-Terraform-Pipeline.png.png)

### GitHub Actions
Workflows in .github/workflows/ automate the same fmt → validate → plan → apply flow, with Checkov security scanning integrated into the pipeline.

![GitHub Actions Checkov Scan](docs/docs/screenshots/P7-GitHub-Actions-Checkov.png.png)

### Atlantis
atlantis.yaml enables Terraform plan/apply directly from GitHub pull request comments, allowing infra changes to be reviewed and approved through the normal PR workflow.

![Atlantis PR Automation](docs/docs/screenshots/P7-Atlantis-PR-Automation.png.png)

## 🖼️ Project Walkthrough (Screenshots)

### Phase 1 — Terraform Foundation
![Terraform Foundation Verification](docs/docs/screenshots/p1-terraform-foundation-verification.png.png)
![Terraform Plan & Apply](docs/docs/screenshots/p1-terraform-plan-apply.png.png)

### Phase 2 — AWS Infrastructure
![VPC Resource Map](docs/docs/screenshots/P2_VPC_Resource_Map.png.png)
![NAT Gateway](docs/docs/screenshots/P2_NAT_Gateway.png.png)
![EC2 IAM Role](docs/docs/screenshots/P2_EC2_IAM_Role.png.png)
![ALB Target Healthy](docs/docs/screenshots/P2_ALB_Target_Healthy.png.png)

### Phase 3 — Terraform Advanced
![Final Terraform Plan - No Changes](docs/docs/screenshots/P3_Final_Terraform_Plan_NoChanges.png.png)

### Phase 4 — Modules
![Module Validation Plan](docs/docs/screenshots/P4_Module_Validation_Plan.png.png)

### Phase 5 — Terraform State
![Terraform State S3 Backend](docs/docs/screenshots/P5_Terraform_State_S3_Backend.png.png)

### Phase 6 — Environments
![Terraform Validation & User Data State](docs/docs/screenshots/P6_Terraform_Validation_UserData_State.png.png)

### Phase 7 — DevOps (CI/CD, Security, PR Automation)
![Jenkins Terraform Pipeline](docs/docs/screenshots/P7-Jenkins-Terraform-Pipeline.png.png)
![GitHub Actions Checkov](docs/docs/screenshots/P7-GitHub-Actions-Checkov.png.png)
![Atlantis PR Automation](docs/docs/screenshots/P7-Atlantis-PR-Automation.png.png)

## 🛠️ Tech Stack

- **IaC:** Terraform
- **Cloud:** AWS (VPC, EC2, ALB, IAM, Security Groups)
- **CI/CD:** Jenkins, GitHub Actions
- **PR Automation:** Atlantis
- **Security:** Checkov

## 📄 License

This project is licensed under the MIT License — see the LICENSE file for details.

## 👤 Author

**Rakesh Sharma**
GitHub: [@Rakesh62041](https://github.com/Rakesh62041)
