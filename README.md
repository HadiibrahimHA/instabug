# GoViolin_Pipeline

##### Table of Contents
1. [Writing Dockerfile](#writing-dockerfile)
2. [Build The DockerImage Locally](#build-the-dockerimage-locally)
3. [Run The Container](#run-the-container)
4. [Access The Website](#access-the-website-using)
5. [Creating Pipeline Job](#creating-pipeline-job)
6. [Creating DockerHub Repository](#creating-dockerhub-repository)
7. [Creating Jenkinsfile And Test It](#creating-jenkinsfile-and-test-it)
8. [Reporting Using Email Notification](#reporting-using-email-notification)

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


## Creating Jenkinsfile And Test It
![alt text](https://github.com/waleednegm/GoViolin_Instabug_Task/blob/main/assets/Screenshot%20from%202022-05-23%2019-55-33-1.png)
![alt text](https://github.com/waleednegm/GoViolin_Instabug_Task/blob/main/assets/Screenshot%20from%202022-05-23%2019-55-49.png)

## Reporting Using Email Notification
![alt text](https://github.com/waleednegm/GoViolin_Instabug_Task/blob/main/assets/Screenshot%20from%202022-05-23%2021-13-48.png)
![alt text](https://github.com/waleednegm/GoViolin_Instabug_Task/blob/main/assets/Screenshot%20from%202022-05-23%2021-27-15.png)



