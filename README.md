# Bank of Anthos

**Bank of Anthos** is a sample HTTP-based web app that simulates a bank's payment processing network, allowing users to create artificial bank accounts and complete transactions. This project is used for Istio ambient mesh evaluation.
Forked from: https://github.com/GoogleCloudPlatform/bank-of-anthos

## Traffic simulation
Loadgenerator is used to continuously sends requests imitating users to the frontend. Periodically creates new accounts and simulates transactions between them. This was used from local system docker run.

## Infrastructure
- GKE provisioned by Tarraform IaC
- Grafana and Prometheus has been used in GKE cluster