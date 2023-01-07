pipeline {
    agent any

    }
    environment {
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

