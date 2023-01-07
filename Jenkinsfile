pipeline {
    agent any
    tools {
       terraform 'Terraform'
    }
   
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Terraform Reconfigure') {
            steps {
                sh 'terraform init -reconfigure'
                
            }
        }


        stage('Terraform Init') {
            steps {
                sh 'terraform init -migrate-state'
                
            }
        }

        stage('Apply') {
            steps {
                sh "terraform apply -auto-approve"
            }
        }
    }
}