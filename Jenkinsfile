import groovy.json.*

def app_name = "Danger Mouse"
//def app_name = "GoExplore"

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
          }
    }  
    stage('Run Checker') {
      steps {
        script{
          hockeyCheck(hockeyApps, app_name)
        }
      }
    }
  }
}


def hockeyCheck(hockeyApps,appName){
  hockeyApps.each { 
    def command = "${env.WORKSPACE}/check_hockeyId.sh ${it.hockeyAppId}"
    def proc = command.execute()
    proc.waitFor()              

    println "Process exit code: ${proc.exitValue()}"
    def exitcode = proc.exitValue()
    def json = new JsonSlurper().parseText(proc.in.text)
    def remote_app_id = json[0].app_id
    
    if(json[0].title.contains(appName)){
      println "Match found"
      println(json[0].app_id)
      println(json[0].title)
    }
    else {
      error('No match found.')
      println(json[0].app_id)
    }
  }
}


