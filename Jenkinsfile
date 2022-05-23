pipeline {
  agent any
  environment
    {
        IMAGE = 'walednegm/gov:1.0'
    }
  stages{
    stage("Build Docker Image"){
          steps{
            echo "Build Docker Image ...."
            sh 'docker build -t ${IMAGE} .'
          }      
    }
    stage("Push Image To DockerHub"){
          steps{
            echo "Push Docker Image ...."
            withCredentials([usernamePassword(credentialsId : 'dockerhub' , passwordVariable: 'password', usernameVariable: 'username')]){
              sh "echo ${password} | docker login -u ${username} --password-stdin"
              sh "docker push ${IMAGE}"
            }
          }      
    }
         
  
  }

}
