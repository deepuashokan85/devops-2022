pipeline {
    agent any

    stages {
        stage('Terraform Init') {
            steps {
                cd terraform
                terraform init
            }
        }

        stage('Terraform Plan') {
            steps {
		cd terraform
                terraform plan
            }
        }

        stage('Terraform Apply') {
            steps {
                cd terraform
                terraform apply
            }
        }
    }
}
