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


