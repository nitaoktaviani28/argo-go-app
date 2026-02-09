FROM golang:alpine
RUN apk update && apk add git \
    && git clone https://gitlab.adinusa.id/bta-adinusa/notes-wiki.git \
    && cd notes-wiki && go build -o web main.go
ENV APP_HOME /go/notes-wiki
WORKDIR "$APP_HOME"
EXPOSE 8686
CMD [ "/go/notes-wiki/web" ]
