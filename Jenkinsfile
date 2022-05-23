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
            try{
            echo "Build Docker Image ...."
            sh 'docker build -t ${IMAGE} .'
            }catch(all){
            
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
  post{
        always{
          mail to: "${EMAIL}",
            subject: "Test Email",
            body: "Test"
        }
    }

}
