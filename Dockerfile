FROM golang:latest
ENV REPO_URL github.com/humbertodias/go-rest-demo
RUN REPO_DIR=$(echo $REPO_URL | cut -d'/' -f3)
RUN go get ${REPO_URL} && go install ${REPO_URL}
CMD ${REPO_DIR}
EXPOSE 8080