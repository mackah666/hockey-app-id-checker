import groovy.json.*

def hockey_app_id = "2439bd963ea84cfca061e8ca1c101d27"
def app_id = 910760

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
        hockeyCheckId(hockey_app_id, app_id)
      }
    }
  }
}


def hockeyCheckId(String hockeyAppId, appId){
  def command = "${env.WORKSPACE}/check_hockeyId.sh ${hockeyAppId}"
  def proc = command.execute()
  proc.waitFor()              

  println "Process exit code: ${proc.exitValue()}"
  if(proc.exitValue() == 0){
    def json = new JsonSlurper().parseText(proc.in.text)
    def remote_app_id = json[0].app_id
    if(remote_app_id == appId){
      println "Match found"
    }
    else {
      error('No match found.')
    }
  }
  else {
    error('Hockey App Id checker returned an error.')
  }
  

  println(json[0].app_id)
}


