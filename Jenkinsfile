pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'cd terraform && terraform init -input=false'
            }
        }

        stage('Terraform Format') {
            steps {
                sh 'cd terraform && terraform fmt -check'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'cd terraform && terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'cd terraform && terraform plan -input=false -var-file="staging.tfvars"'
            }
        }

        stage('Manual Approval') {
            steps {
                input message: 'Terraform plan reviewed. Apply changes?', 
                      ok: 'Apply Terraform'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'cd terraform && terraform apply -input=false -auto-approve -var-file="staging.tfvars"'
            }
        }
    }
}
