pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
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
                sh 'cd terraform && terraform plan -var-file="staging.tfvars"'
            }
        }
    }
}
