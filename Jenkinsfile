pipeline {
    agent any

    stages {
        stage('mvn build') {
            steps {
                echo 'mvn build'
            }
        }
        stage('deploy') {
            steps {
                ech 'ansible-playbook'
            }
        }
        stage('testing') {
            steps {
                echo 'selinium Testing'
            }
        }
        stage('Dev deployment') {
            steps {
                echo 'Ansible-playbook'
            }
        }
        stage('Prod deployment') {
            steps {
                echo 'ansible-playbook'
            }
        }
    }
}
