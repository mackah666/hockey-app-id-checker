import groovy.json.*

def id = "2439bd963ea84cfca061e8ca1c101d27"

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
    stage('Run Checker') {
      steps {
        echo 'Copy bundled game content'
      }
    }
  }
}


