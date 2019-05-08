import groovy.json.*

def hockey_app_id = "2439bd963ea84cfca061e8ca1c101d27"
def app_id = 910760

def  hockeyApps  = [
        [
            id: 926111,
            hockeyAppId : "65be71a7e1dd409c9381e78ba53054f0"
        ],
        [
            id: 926118,
            hockeyAppId : "3fc8a75135c94f89a3b46326d12add6f"
        ],
        [
            id: 899939,
            hockeyAppId : "0c159c702a6a4ed8a51df28a8dc8b726"
        ]
]

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
        //hockeyCheckId(hockey_app_id, app_id)
        script{
          androidBuildTypes.each { 
            println "$it.id: $it.hockeyAppId" 
            hockeyCheckId($it.hockeyAppId, $it.id)
          }
        }
      }
    }
  }
}


def hockeyCheckId(String hockeyAppId, appId){
  def command = "${env.WORKSPACE}/check_hockeyId.sh ${hockeyAppId}"
  def proc = command.execute()
  proc.waitFor()              

  println "Process exit code: ${proc.exitValue()}"
  def exitcode = proc.exitValue()
  def json = new JsonSlurper().parseText(proc.in.text)
  def remote_app_id = json[0].app_id
  
  if(remote_app_id == appId){
    println "Match found"
  }
  else {
    error('No match found.')
  }


  

  println(json[0].app_id)
}


