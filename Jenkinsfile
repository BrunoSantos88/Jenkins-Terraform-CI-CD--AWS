pipeline {
    agent any
    tools {
       terraform 'Terraform'
    }
    
    stages {
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform apply') {
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }

    
}