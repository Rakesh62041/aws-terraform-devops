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
                    terraform init -reconfigure -input=false
                '''
            }
        }

      stage('Jenkins Environment Verification') {
    steps {
        sh '''
            echo "===== JENKINS WORKSPACE ====="
            pwd

            echo "===== GIT COMMIT ====="
            git rev-parse HEAD

            echo "===== GIT BRANCH ====="
            git branch --show-current

            echo "===== BACKEND ====="
            cat terraform/backend.tf

            echo "===== TFVARS ====="
            cat terraform/staging.tfvars

            echo "===== STATE LIST ====="
            cd terraform
            terraform state list

            echo "===== STATE: ALB SG ====="
            terraform state show aws_security_group.alb || true

            echo "===== STATE: IAM ROLE ====="
            terraform state show aws_iam_role.ec2_role || true

            echo "===== STATE: S3 ====="
            terraform state show aws_s3_bucket.project_bucket || true
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
