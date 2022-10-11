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
         
         stage('Build') {
                sh 'mvn  clean package'
        }
    
       
    }catch(e){
//         currentBuild.result = "FAILED"
        throw e
    }finally{
//         notifyBuild(currentBuild.result)
    }
}



