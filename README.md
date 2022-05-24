# GoViolin_Instabug_Task



## Writing Dockerfile
```
FROM golang:1.16-alpine
WORKDIR /GoViolin_app
COPY . .
RUN go mod init goviolin_app
RUN go build -o /goviolin_app
EXPOSE 8080
CMD [ "/goviolin_app" ]
```

## Build The DockerImage Locally
```
docker build -t walednegm/gov:1.0 .
```
![alt text](https://github.com/waleednegm/GoViolin_Instabug_Task/blob/main/assets/Screenshot%20from%202022-05-23%2019-26-51.png)
## Run The Container
- using docker run
```
docker run -p 8080:8080 walednegm/gov:1.0
```
- using docker-compose
```
docker-compose -f compose.yml up
```

### Access The Website Using 
http://127.0.0.1:8080/


## Creating Pipeline Job
![alt text](https://github.com/waleednegm/GoViolin_Instabug_Task/blob/main/assets/gif1.gif)

## Creating DockerHub Repository
![alt text](https://github.com/waleednegm/GoViolin_Instabug_Task/blob/main/assets/gif2.gif)


## Creating Jenkinsfile
```
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
    stage("Deploy Using Kubernetes and Minikube"){
          steps{
            script{
            sh "kubectl apply -f kube_deploy.yml"
          }      
    }
  }
    
  

}
}
```


