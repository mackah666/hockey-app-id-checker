pipeline {
  agent any
  stages {
    stage("Print Environment") {
           steps {
            sh "pwd"
                sh "printenv"
                //print params
          }
    }
    stage("Print PR") {
           steps {
          // This printed null, I have set the Github PR builder
          script{
            if(env.CHANGED_ID)
            {
              echo "PR exits"
            }
            else{
              echo "No PR Exists"
            }
          }
          //echo "${env.CHANGED_ID}"git 
          }
    }   
    stage('GMI Android Library Tests') {
      steps {
        echo 'GMI Android Library Tests'
      }
    }
    stage('Framework Android Unit Tests') {
      steps {
        echo 'Framework Android Unit Tests'
      }
    }
    stage('Copy bundled game') {
      steps {
        echo 'Copy bundled game content'
      }
    }
  }
}


