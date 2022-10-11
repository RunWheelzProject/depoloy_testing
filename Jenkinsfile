node {
    def WORKSPACE = "G:\\docker_test\\sourcode\\docker_demo"
    def dockerImageTag = "docker_demo${env.BUILD_NUMBER}"

    try{
//          notifyBuild('STARTED')
         stage('Clone Repo') {
            // for display purposes
            // Get some code from a GitHub repository
            git url: 'https://github.com/RunWheelzProject/depoloy_testing.git',
                branch: 'main'
         }
          stage('Build docker') {
                 dockerImage = docker.build("docker_demo:${env.BUILD_NUMBER}")
          }

          stage('Deploy docker'){
                  echo "Docker Image Tag Name: ${dockerImageTag}"
                  sh "docker stop docker_demo || true && docker rm docker_demo || true"
                  sh "docker run --name docker_demo -d -p 8081:8081 docker_demo:${env.BUILD_NUMBER}"
          }
    }catch(e){
//         currentBuild.result = "FAILED"
        throw e
    }finally{
//         notifyBuild(currentBuild.result)
    }
}


node {
    // reference to maven
    // ** NOTE: This 'maven-3.6.1' Maven tool must be configured in the Jenkins Global Configuration.   
    def mvnHome = 'C:/Program Files/Maven/apache-maven-3.8.6/bin'

    // holds reference to docker image
    def dockerImage
    // ip address of the docker private repository(nexus)
    
    def dockerRepoUrl = "localhost:8081"
    def dockerImageName = "hello-world-java"
    def dockerImageTag = "${dockerRepoUrl}/${dockerImageName}:${env.BUILD_NUMBER}"
    
    stage('Clone Repo') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/dstar55/docker-hello-world-spring-boot.git'
      // Get the Maven tool.
      // ** NOTE: This 'maven-3.6.1' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = 'C:/Program Files/Maven/apache-maven-3.8.6/bin'
    }    
  
    stage('Build Project') {
      // build project via maven
      sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
    }
		
    stage('Build Docker Image') {
      // build docker image
      sh "whoami"
      sh "ls -all /var/run/docker.sock"
      sh "mv ./target/hello*.jar ./data" 
      
      dockerImage = docker.build("hello-world-java")
    }
   
    stage('Deploy Docker Image'){
      
      // deploy docker image to nexus

      echo "Docker Image Tag Name: ${dockerImageTag}"

      sh "docker login -u mdits -p mdits@2022 ${dockerRepoUrl}"
      sh "docker tag ${dockerImageName} ${dockerImageTag}"
      sh "docker push ${dockerImageTag}"
    }
}

