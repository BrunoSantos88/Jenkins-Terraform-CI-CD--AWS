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
          sh 'terraform apply -auto-approve'
          sh 'terraform output kubeconfig > ./kubeconfig'
          sh 'terraform output config_map_aws_auth > ./config_map_aws_auth.yaml'
          sh 'export KUBECONFIG=./kubeconfig'
            }
        }
        }
}
        