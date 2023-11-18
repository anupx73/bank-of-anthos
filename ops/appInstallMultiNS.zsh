#!/bin/zsh
#

appDeployMultiNS() {
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/accounts-db.yaml
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/config.yaml -n boa-acc-db-ns
  
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/ledger-db.yaml
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/config.yaml -n boa-ledger-db-ns

  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/balance-reader.yaml &&
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/config.yaml -n boa-balance-ns
    
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/contacts.yaml &&
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/config.yaml -n boa-contact-ns
    
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/frontend.yaml &&
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/config.yaml -n boa-front-ns
    
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/ledger-writer.yaml &&
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/config.yaml -n boa-ledger-ns
    
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/transaction-history.yaml &&
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/config.yaml -n boa-transaction-ns

  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/userservice.yaml &&
  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/config.yaml -n boa-user-ns

  kubectl apply -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/frontend-gateway.yaml
}

appScaleMultiNS() {
  kubectl scale statefulsets accounts-db --replicas=$1 -n boa-acc-db-ns &&
  kubectl scale statefulsets ledger-db --replicas=$1 -n boa-ledger-db-ns &&
  kubectl scale deployment/balancereader --replicas=$1 -n boa-balance-ns &&
  kubectl scale deployment/contacts --replicas=$1 -n boa-contact-ns &&
  kubectl scale deployment/frontend --replicas=$1 -n boa-front-ns &&
  kubectl scale deployment/ledgerwriter --replicas=$1 -n boa-ledger-ns &&
  kubectl scale deployment/transactionhistory --replicas=$1 -n boa-transaction-ns &&
  kubectl scale deployment/userservice --replicas=$1 -n boa-user-ns
}

appDeleteMultiNS() {
  kubectl delete -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/accounts-db.yaml
  kubectl delete -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/ledger-db.yaml
  kubectl delete -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/balance-reader.yaml
  kubectl delete -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/contacts.yaml
  kubectl delete -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/frontend.yaml
  kubectl delete -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/ledger-writer.yaml
  kubectl delete -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/transaction-history.yaml
  kubectl delete -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/userservice.yaml
  kubectl delete -f /Users/anupam.saha/anupx73/bank-of-anthos/app-multi-ns/frontend-gateway.yaml
}

nsDeleteMultiNS() {
  kubectl delete ns boa-user-ns
  kubectl delete ns boa-transaction-ns
  kubectl delete ns boa-ledger-ns
  kubectl delete ns boa-front-ns
  kubectl delete ns boa-contact-ns
  kubectl delete ns boa-balance-ns
  kubectl delete ns boa-ledger-db-ns
  kubectl delete ns boa-acc-db-ns
}