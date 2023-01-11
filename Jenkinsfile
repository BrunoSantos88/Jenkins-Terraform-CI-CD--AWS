pipeline {
    agent any
    tools {
       terraform 'Terraform 1.3.7'
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

        stages {
        
    stage('Clone repository') { 
      steps { 
        script{
          checkout scm
            }
             } 
    }

        stage('Terraform fmt') {
            steps {
                sh 'terraform fmt '
                
            }
        }

        stage('Apply') {
            steps {
          sh 'terraform destroy -auto-approve'
            }
        }
        }
  }

        