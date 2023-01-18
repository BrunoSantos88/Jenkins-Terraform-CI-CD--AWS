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

 //stage('Kubernetes Datadog TOKEN') {
	//   steps {
	//      withKubeConfig([credentialsId: 'kubelogin']) {
		//  sh ('kubectl create secret generic datadog-secret --from-literal api-key=DATADOGTOKEN --from-literal app-key=DATADOGTOKEN')
		//  sh ('kubectl create secret generic datadog-secret --from-literal api-key=TOKEN --from-literal app-key=GENERICOTOKEN')

		//  }
	  // }
//}

   stage('Kubernetes Datadog monitoring AGENTES') {
	   steps {
	      withKubeConfig([credentialsId: 'kubelogin']) {
		  sh ('kubectl apply -f cluster-agent-rbac.yaml')
          sh ('kubectl apply -f rbac.yaml')
		  sh ('kubectl apply -f datadog-agent.yaml')
		  sh ('kubectl apply -f -datadog-monitoring/datadog-cluster-agent.yaml')
		}
	      }
   	}

}
}
