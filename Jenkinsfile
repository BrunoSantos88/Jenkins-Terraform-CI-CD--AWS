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
        stage('Terraform Init') {
            steps {
                sh 'terraform init -reconfigure'
                sh 'terraform init '
                
            }
        }

        stage('Apply') {
            steps {
                sh "terraform apply -auto-approve"
            }
        }
    }
}