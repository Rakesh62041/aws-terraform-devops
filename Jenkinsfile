pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
    }

    stages {

        stage('Checkout') {
            steps {
                deleteDir()

                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    cd terraform

                    terraform init \
                      -reconfigure \
                      -input=false
                '''
            }
        }

        stage('Terraform Fmt') {
            steps {
                sh '''
                    cd terraform
                    terraform fmt -check -recursive
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                    cd terraform
                    terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    cd terraform

                    rm -f tfplan

                    terraform plan \
                      -input=false \
                      -var-file=staging.tfvars \
                      -out=tfplan
                '''
            }
        }

        stage('Manual Approval') {
            steps {
                input(
                    message: 'Terraform plan reviewed. Apply changes?',
                    ok: 'Apply Terraform'
                )
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                    cd terraform

                    terraform apply \
                      -input=false \
                      -auto-approve \
                      tfplan
                '''
            }
        }
    }
}
