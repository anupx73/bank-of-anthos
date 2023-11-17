#!/bin/zsh
#

startDocker() {
  open -a Docker
  sleep 20
}

buildLoad() {
  cd loadgenerator/
  docker build -t cd loadgen .
}

execLoad() {
  APP_ADDR=$(kubectl -n istio-system get service istio-ingressgateway --output jsonpath='{.status.loadBalancer.ingress[0].ip}')
  docker run -e FRONTEND_ADDR=$APP_ADDR -it loadgen
}
