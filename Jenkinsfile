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
        hockeyCheckId(id)
      }
    }
  }
}


def hockeyCheckId(String hockeyAppId){
  def command = "${env.WORKSPACE}/check_hockeyId.sh ${hockeyAppId}"
  def proc = command.execute()
  proc.waitFor()              

  println "Process exit code: ${proc.exitValue()}"
  //println "Std Err: ${proc.err.text}"
  //println "Std Out: ${proc.in.text}" 

  def json = new JsonSlurper().parseText(proc.in.text)

  println json.results.size()

  println(json[0].app_id)
}


