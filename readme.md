# Simple Web Application Using R

## Build & Run

Use the following command to build docker image

- Shiny version `docker build -f Dockerfile-shiny -t imageName .`
- Plumber version `docker build -f Dockerfile-plumber -t imageName .`

Use the following command to run docker image

`docker run --rm -p8000:8000 imageName`

## Testing

- To test Shiny version, open docker container url in your browser e.g. http://localhost:8080
- To test Plumber version, use curl to upload test data e,g.
  `curl -i -v -F id=1234 -F upload=@test-data.csv http://localhost:8000/upload`
  Note: Plumber version expose only RESTful API