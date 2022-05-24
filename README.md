# GoViolin_Instabug_Task



## Write Dockerfile
```
FROM golang:1.16-alpine
WORKDIR /GoViolin_app
COPY . .
RUN go mod init goviolin_app
RUN go build -o /goviolin_app
EXPOSE 8080
CMD [ "/goviolin_app" ]
```

## Build The DockerImage
```
docker build -t walednegm/gov:1.0 .
```
![alt text](https://github.com/waleednegm/GoViolin_Instabug_Task/blob/main/assets/Screenshot%20from%202022-05-23%2019-26-51.png)
- Run The Container
```
docker run -p 8080:8080 walednegm/gov:1.0
```
- You can also run the container using docker-compose
```
docker-compose -f compose.yml up
```

### Access The Website Using 
http://127.0.0.1:8080/

## Steps:
### Creating Pipeline Job
![alt text](https://github.com/waleednegm/GoViolin_Instabug_Task/blob/main/assets/gif1.gif)

### Creating DockerHub Repository
![alt text](https://github.com/waleednegm/GoViolin_Instabug_Task/blob/main/assets/gif2.gif)

