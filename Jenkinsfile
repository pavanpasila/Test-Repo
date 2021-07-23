pipeline {
  
  agent any
  
  stages {
    stage ('stage scm'){
      steps {
        git 'https://github.com/dstar55/docker-hello-world-spring-boot.git'
       
      }
      stage ('stage maven'){
        steps {
        sh 'mvn clean install'
      
        }
      }  
    }
  }
}
