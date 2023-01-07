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

        stage('Terraform Apply'){
            steps{
                withCredentials([[
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                sh 'terraform apply --auto-approve'
                }
            }
        }
    }
}