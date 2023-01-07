pipeline {
    agent any
    
    }
    environment {
        TF_HOME = tool('terraform')
        ACCESS_KEY = credentials('AWS_ACCESS_KEY_ID')
        SECRET_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
            stage('TerraformInit'){
            steps {
                    sh "terraform init"            
                }
            }
        }
        
        stage('TerraformApply'){
            steps {
                script{
                            sh 'terraform apply --auto-approve' 
                        }
                    }
                }

