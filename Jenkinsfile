pipeline {
  
  agent any
  
  stages {
    stage ('stage scm'){
      steps {
        git 'https://github.com/dstar55/docker-hello-world-spring-boot.git'
       
      }
    }
      stage ('stage maven'){
        steps {
        sh 'mvn clean install'
      
        
      }  
    }
    stage ('stage nexus push'){
      steps {
        script {
          nexusArtifactUploader artifacts: [
            [
              artifactId: 'hello-world',
              classifier: '', 
              file: 'target/hello-world-0.1.0.jar', 
              type: 'jar']], 
            credentialsId: 'pavan_nexus', 
            groupId: 'dev',
            nexusUrl: '172.31.6.132:8081',
            nexusVersion: 'nexus3', 
            protocol: 'http',
            repository: 'Demo_repo', 
            version: "${BUILD_NUMBER}"
        }
      }
    }
  }
}
