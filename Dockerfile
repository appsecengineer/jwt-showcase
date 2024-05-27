# syntax=docker/dockerfile:1
# Alpine is chosen for its small footprint
FROM golang:alpine

# Alpine lacks bash, so let's install it
RUN apk add --no-cache bash
RUN apk add httpie --no-cache

RUN mkdir /dockapp
WORKDIR /dockapp

# Copy and download necessary Go modules
COPY . /dockapp
RUN go get -d -v ./...
RUN go install -v ./...

# Build the golang app and expose port to outside world
RUN go build -o /go_JWT
EXPOSE 8000 8000    

CMD ["/go_JWT"]