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
                export TF_VAR_ami_id=$ami_id
                export TF_VAR_count_num=$count
                terraform plan
		'''
            }
        }

        stage('Terraform Apply') {
            steps {
		sh '''
                cd terraform
 		pwd
                export TF_VAR_ami_id=$ami_id
                export TF_VAR_count_num=$count
                terraform apply --auto-approve
		'''
            }
        }
    }
}
