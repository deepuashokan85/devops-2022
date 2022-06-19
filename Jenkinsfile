pipeline {
    agent any

    stages {
        stage('Terraform Init') {
            steps {
		sh '''
                cd terraform
                pwd
                terraform init
  		'''
            }
        }

        stage('Terraform Plan') {
            steps {
		sh '''
		cd terraform
 		pwd
                terraform plan
		'''
            }
        }

        stage('Terraform Apply') {
            steps {
		sh '''
                cd terraform
 		pwd
                terraform apply --auto-approve
		'''
            }
        }
    }
}
