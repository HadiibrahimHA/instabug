pipeline {
  agent any
  environment
    {
        IMAGE = 'walednegm/gov:1.0'
        EMAIL = 'walednegm4444@gmail.com'
    }
  stages{
    stage("Build Docker Image"){
          steps{
            script{
            try {
              echo "Build Docker Image ...."
              sh 'docker build -t ${IMAGE} .'
              echo "Send Successful Build Massage"
              mail to: "${EMAIL}",subject: "GOViolin Pipeline Successful Build",body: "Docker Image has been built successfully"
            }catch(all){
              echo "Send Faild Build Massage"
              mail to: "${EMAIL}",subject: "GOViolin Pipeline Successful Build",body: "Docker Image Faild to built"
              }
            }
          }      
    }
    stage("Push Image To DockerHub"){
          steps{
            script{
            try {
            echo "Push Docker Image ...."
            withCredentials([usernamePassword(credentialsId : 'dockerhub' , passwordVariable: 'password', usernameVariable: 'username')]){
              sh "echo ${password} | docker login -u ${username} --password-stdin"
              sh "docker push ${IMAGE}"
            }
              echo "Send Successful Push Massage"
              mail to: "${EMAIL}",subject: "GOViolin Pipeline Successful Push to Dockerhub",body: "Docker Image has been pushed successfully to Dockerhub"
            }catch(all){
              echo "Send Faild Push Massage"
              mail to: "${EMAIL}",subject: "GOViolin Pipeline Successful Build",body: "Docker Image Faild to push to Dockerhub"
            }
              
          }      
    }
    
         
  
  }
  

}
