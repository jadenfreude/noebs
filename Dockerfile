FROM golang:alpine 

# install git
RUN apk update && apk add --no-cache git

RUN apk add build-base

ADD https://api.github.com/repos/jadenfreude/noebs/git/refs/heads/master version.json
#RUN go get -u -v github.com/jadenfreude/noebs

RUN go install github.com/jadenfreude/noebs@latest

ENTRYPOINT /go/bin/noebs

EXPOSE 8080
