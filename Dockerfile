FROM golang:1.16-alpine
WORKDIR /GoViolin_app
COPY . .
RUN go mod init goviolin_app
RUN go build -o /goviolin_app
EXPOSE 8080
CMD [ "/goviolin_app" ]
