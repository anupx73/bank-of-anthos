#!/bin/zsh
#

appDeploy() {
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app -n boa
}

appScale() {
  kubectl scale --replicas=$1 deployment/balancereader -n boa &&
  kubectl scale --replicas=$1 deployment/contacts -n boa &&
  kubectl scale --replicas=$1 deployment/frontend -n boa &&
  kubectl scale --replicas=$1 deployment/ledgerwriter -n boa &&
  kubectl scale --replicas=$1 deployment/transactionhistory -n boa &&
  kubectl scale --replicas=$1 deployment/userservice -n boa
}

appDelete() {
  kubectl delete -f /Users/anupam.saha/anupx73/bank-of-anthos/app -n boa
  kubectl delete ns boa
}
