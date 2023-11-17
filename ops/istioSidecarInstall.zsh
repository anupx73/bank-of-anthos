#!/bin/zsh
#

istioInstall() {
  # "Connecting to Cluster.."
  gcloud container clusters get-credentials tud-eu-west1-cluster --zone=europe-west1-b --project=tudublin

  # "Installing Istio in Sidecar Mode"
  istioctl install --set profile=default -y

  # "Labelling boa with Istio"
  kubectl create ns boa
  kubectl label namespace boa istio-injection=enabled

  # "Print Ingress"
  kubectl -n istio-system get service istio-ingressgateway
}

istioUninstall() {
  istioctl uninstall -y --purge
  kubectl delete ns istio-system
}
