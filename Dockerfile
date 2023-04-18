# Use a Go 1.20 Base Image
FROM golang:1.20
# Inside the image, set the working directory to '/app'
WORKDIR /app
# Copy go.mod and go.sum into app image
COPY go.mod go.sum ./
# Install modules into directory inside image
RUN go mod download
# Copy source code into image
COPY *.go ./
# Compile application
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-pocketbase
# Serve application on container start
CMD ["/docker-pocketbase", "serve", "--http=0.0.0.0:8080"]