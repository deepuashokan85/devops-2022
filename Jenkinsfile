pipeline {
    agent any

    stages {
        stage('Terraform Init') {
            steps {
                cd terraform
                pwd
                terraform init
            }
        }

        stage('Terraform Plan') {
            steps {
		cd terraform
 		pwd
                terraform plan
            }
        }

        stage('Terraform Apply') {
            steps {
                cd terraform
 		pwd
                terraform apply
            }
        }
    }
}
