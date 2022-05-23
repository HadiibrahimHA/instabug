pipeline {
  agent any
  stages{
    stage("Build Docker Image"){
          steps{
            echo "Build Docker Image ...."
            sh 'docker build -t walednegm/gov:1.0 .'
          }      
    }
    stage("Push To DockerHub"){
          steps{
            echo "Push Docker Image ...."
            withCredentials([usernamePassword(credentialsId : 'dockerhub' , passwordVariable: 'password', usernameVariable: 'username')]){
              
            }
          }      
    }
  
  }

}
