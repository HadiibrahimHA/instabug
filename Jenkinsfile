pipeline {
  agent any
  stages{
    stage("Build Docker Image"){
          steps{
            echo "Build Docker Image ...."
            sh 'docker build -t walednegm/gov:1.0 .'
          }      
    }
    stage("Push Image To DockerHub"){
          steps{
            echo "Push Docker Image ...."
            withCredentials([usernamePassword(credentialsId : 'dockerhub' , passwordVariable: 'password', usernameVariable: 'username')]){
              sh "echo ${password} | docker login -u ${username} --password-stdin"
              sh "docker push walednegm/gov:1.0"
            }
          }      
    }
    stage("Deploy"){
          steps{
            
          }      
    }
  
  }

}
