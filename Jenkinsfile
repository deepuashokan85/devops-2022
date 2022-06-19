pipeline {
    agent any

    parameters {
        choice(name: 'CHOICE', choices: ['AWS', 'AZ', 'GCP'], description: 'Pick Cloud Provider')
        string(name: 'ami_id', defaultValue: '', description: 'pass AMI ID')
        string(name: 'count', defaultValue: '', description: 'Instance Count')

    }

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
                terraform destroy --auto-approve
		'''
            }
        }
    }
}
