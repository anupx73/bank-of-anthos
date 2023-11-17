#!/bin/zsh
#

ambientInstall () {
  # "Connecting to Cluster.."
  gcloud container clusters get-credentials tud-eu-west1-cluster --zone=europe-west1-b --project=tudublin

  # Installing Istio in Ambient Mode
  istioctl install --set profile=ambient \
  --set "components.ingressGateways[0].enabled=true" \
  --set "components.ingressGateways[0].name=istio-ingressgateway" -y

  # Labelling Namespace
  kubectl create ns boa
  kubectl label namespace boa istio.io/dataplane-mode=ambient

  # Print Ingress
  sleep 15
  kubectl -n istio-system get service istio-ingressgateway
}

ambientL7Install() {
  # Installing K8s Gateway API CRD
  # kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
  #   { kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v0.8.0" | kubectl apply -f -; }
  kubectl -n istio-system apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml

  # Installing Istio Waypoint Proxy
  istioctl x waypoint apply -n boa
}

ambientUninstall() {
  istioctl uninstall -y --purge
  kubectl -n istio-system delete -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml 
  kubectl delete ns istio-system
}
