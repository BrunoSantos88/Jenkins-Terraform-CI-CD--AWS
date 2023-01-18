pipeline {
  agent any
  
  tools { 
        ///depentencias 
        maven 'MAVEN 3.5.2' 
    }

stages {   

stage('GIT CLONE') {
  steps {
                // Get code from a GitHub repository
    git url: 'https://github.com/BrunoSantos88/Jenkins-frontend.git', branch: 'main',
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

   stage('Kubernetes Datadog monitoring') {
	   steps {
	      withKubeConfig([credentialsId: 'kubelogin']) {
		  sh ('kubectl apply -f -datadog-monitoring/cluster-agent-rbac.yaml')
      sh ('kubectl apply -f -datadog-monitoring/rbac.yaml')

      rbac.yaml
		}
	      }
   	}

stage('Kubernetes Datadog Agent') {
	   steps {
	      withKubeConfig([credentialsId: 'kubelogin']) {
		  sh ('kubectl apply -f -datadog-monitoring/datadog-agent.yaml')
		}
	      }
   	}


  stage('Kubernetes Datadog AgentCluster') {
	   steps {
	      withKubeConfig([credentialsId: 'kubelogin']) {
		  sh ('kubectl apply -f -datadog-monitoring/datadog-cluster-agent.yaml')
		}
	      }
   	}

  

}
}