pipeline {
  agent any

  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerlogin')
  }

  tools { 
        ///depentencias 
        maven 'Maven 3.6.3' 
    }

stages {   

stage('GIT CLONE') {
  steps {
                // Get code from a GitHub repository
    git url: 'https://github.com/BrunoSantos88/Jenkins-Terraform-CI-CD--AWS.git', branch: 'main',
    credentialsId: 'jenkins-aws'
          }
  }

   
stage('Synk-GateSonar-Security') {
            steps {		
				withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'SNYK_TOKEN')]) {
					sh 'mvn snyk:test -fn'
				}
			}
  }

///DockerProcesso
   stage('Docker Build') {
      steps {
        sh 'docker build -t brunosantos88/jenkins-slave dockerfile/.'
     }
    }

   stage('Docker Login') {
      steps {
       sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
     }
    }
   
   stage('Docker Push') {
     steps {
        sh 'docker push brunosantos88/jenkins-slave:latest'
     }
   }

stage("cloudFormation") {
            steps {
                script {
                    withAWS(credentials: aws-credentials) {
                        cfnUpdate(
                            stack: stackName,
                            file: "infra-rede-publica.yaml",
                            params: [
                                "uniqString=${uniqString}"
                            ],
                            timeoutInMinutes: 10,
                            pollInterval: 600
                        )
                    }
                }
            }
        }
}
}

