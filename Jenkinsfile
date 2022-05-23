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
              echo "Send Successful  Massage"
              mail to: "${EMAIL}",subject: "GOViolin Pipeline Successful Build",body: "Docker Image has been built successfully"
            }catch(all){
              echo "Send Faild Massage"
              mail to: "${EMAIL}",subject: "GOViolin Pipeline Successful Build",body: "Docker Image Faild to built"
              }
            }
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
