pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/BrunoSantos88/Jenkins-Terraform-CI-CD--AWS.git']]])            

          }
        }
        
        stage ("terraform init") {
            steps {
                sh ('terraform init -reconfigure ') 
            }
        }
        
        stage ("terraform Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
           }
        }
    }
}