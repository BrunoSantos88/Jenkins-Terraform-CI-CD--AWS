pipeline {
  agent any

  tools { 
        ///depentencias 
        maven 'Maven 3.5.2' 
        terraform 'Terraform 1.3.7' 
    }
        environment {
        //aws
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

// Stages.
  stages {   

    stage('Slack Notification(Pipeline Start Process)') {
      steps {
        slackSend message: 'Pipeline Inciada!. Necessidade de atenção, caso seja em Produção!'

}
}

    stage('Clone repository') { 
      steps { 
        script{
          checkout scm
            }
             } 
    }


   stage('Slack Notification(Terraform Start Process)') {
            steps {
              slackSend message: 'Agora terraform acabou de iniciar, está iniciando o processo de construção da rede publica,assim que terminado, será criado o Cluster EKS na AWS!'
                }
            }


///INFRA iS CODE 
    stage('TF INIT') {
            steps {
                sh 'terraform init '
                
            }
        }

        stage('TF FMT') {
            steps {
                sh 'terraform fmt '
                
            }
        }

        stage('TF Destroy') {
            steps {
          sh 'terraform destroy -auto-approve'
            }
        }
        }
        

// Email Notification
      post {
        always {
            echo "Notifying build result by email"
        }
        success {
            mail to: 'infratidevops@gmail.com',
                 subject: "SUCCESS: ${currentBuild.fullDisplayName}",
                 body: "Pipeline passou, Efetou com Sucesso"

        }
        failure {
           mail to: 'infratidevops@gmail.com',
                subject:"FAILURE: ${currentBuild.fullDisplayName}",
                body: "Pipeline Falhou , verificar os parametros corretos!"

        }
      }
}

        