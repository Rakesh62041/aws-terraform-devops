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
Terraform installed and configured, with provider setup and initial workflow (`init`, `plan`, `apply`) verified successfully.

![Terraform Foundation Verification](docs/docs/screenshots/p1-terraform-foundation-verification.png.png)

The core Terraform commands executed end-to-end — plan generated and applied without errors, confirming the foundation setup works correctly.

![Terraform Plan & Apply](docs/docs/screenshots/p1-terraform-plan-apply.png.png)

---

### Phase 2 — AWS Infrastructure
Complete VPC setup with public/private subnets, route tables, and internet gateway — visualized here via the AWS VPC resource map.

![VPC Resource Map](docs/docs/screenshots/P2_VPC_Resource_Map.png.png)

NAT Gateway provisioned to allow private subnet instances outbound internet access without exposing them publicly.

![NAT Gateway](docs/docs/screenshots/P2_NAT_Gateway.png.png)

IAM Role attached to the EC2 instance, following least-privilege principles for secure access to AWS services.

![EC2 IAM Role](docs/docs/screenshots/P2_EC2_IAM_Role.png.png)

Application Load Balancer target group showing healthy EC2 instances — confirming the ALB health checks and routing are working correctly.

![ALB Target Healthy](docs/docs/screenshots/P2_ALB_Target_Healthy.png.png)

---

### Phase 3 — Terraform Advanced
Final `terraform plan` output showing **no changes** — infrastructure state fully matches the code, confirming a clean and drift-free deployment.

![Final Terraform Plan - No Changes](docs/docs/screenshots/P3_Final_Terraform_Plan_NoChanges.png.png)

---

### Phase 4 — Modules
Infrastructure refactored into reusable Terraform modules (VPC, EC2, Security Group, ALB) — plan output confirms modules validate and integrate correctly with the root configuration.

![Module Validation Plan](docs/docs/screenshots/P4_Module_Validation_Plan.png.png)

---

### Phase 5 — Terraform State
Remote state backend configured using S3, enabling secure, centralized, and team-shareable state management (with state locking).

![Terraform State S3 Backend](docs/docs/screenshots/P5_Terraform_State_S3_Backend.png.png)

---

### Phase 6 — Environments
Environment-specific configuration validated — user data scripts and state applied correctly across different `.tfvars` environment setups (dev/staging/prod).

![Terraform Validation & User Data State](docs/docs/screenshots/P6_Terraform_Validation_UserData_State.png.png)

---

### Phase 7 — DevOps (CI/CD, Security, PR Automation)
Jenkins pipeline automating the full Terraform workflow — fmt → validate → plan → manual approval → apply — running successfully end-to-end.

![Jenkins Terraform Pipeline](docs/docs/screenshots/P7-Jenkins-Terraform-Pipeline.png.png)

GitHub Actions workflow with integrated Checkov security scanning — catching misconfigurations automatically before infrastructure changes are applied.

![GitHub Actions Checkov](docs/docs/screenshots/P7-GitHub-Actions-Checkov.png.png)

Atlantis enabling PR-based infrastructure automation — Terraform plan/apply triggered directly from pull request comments for a fully reviewed GitOps workflow.

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
