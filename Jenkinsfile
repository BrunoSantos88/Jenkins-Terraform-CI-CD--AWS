pipeline {
    agent any
    tools {
       terraform 'Terraform'
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    
        stage('Terraform Init') {
            steps {
                sh 'terraform init'      
            }
        }
        stage('Apply') {
            steps {
          sh './terraformw apply -auto-approve'
            }
        }
    }
}