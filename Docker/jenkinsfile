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
    stage ('Deploy Artifact into server2'){
      steps {
        script {
        def remote = [:]
    remote.name = 'ip-172-31-18-74.us-east-2.compute.internal'
    remote.host = '172.31.18.74'
    remote.user = 'new_user'
    remote.password = 'jenkins123!'
    remote.allowAnyHosts = true
      sshCommand remote: remote, command: "ls -lrt"
      sshCommand remote: remote, command: "curl -L -X GET 'http://3.22.41.142:8081/service/rest/v1/search/assets/download?sort=version&repository=Demo_repo&group=dev&name=hello-world&maven.baseVersion=${BUILD_NUMBER}' --output /tmp/hello-world.jar"
      sshCommand remote: remote, command: "/tmp/deploy.sh > /tmp/deploy.log"
          sshCommand remote: remote, command: "sleep 60"
          sshCommand remote: remote, command: "cat /tmp/deploy.log"
        }
      }
    }
  }
}
