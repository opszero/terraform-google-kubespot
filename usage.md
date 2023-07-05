# Kubespot (GCP)

<img src="http://assets.opszero.com/images/auditkube.png" width="200px" />

Compliance Oriented Kubernetes Setup for Google Cloud.

# Tools & Setup

```
brew install kubectl kubernetes-helm google-cloud-sdk terraform
```

# Terraform usage

```
gcloud auth activate-service-account --key-file=./account.json
terraform init && terraform get -update && terraform apply


gcloud config set account foo@opszero.com # Set account name
gcloud container clusters get-credentials <clustername> --region us-central1
```
