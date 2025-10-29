<!-- BEGIN_TF_DOCS -->
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
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_repair"></a> [auto\_repair](#input\_auto\_repair) | Enables or disables automatic repair of nodes in the cluster. | `bool` | `true` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | Enables or disables automatic upgrades of nodes in the cluster. | `bool` | `true` | no |
| <a name="input_cluster_create_timeouts"></a> [cluster\_create\_timeouts](#input\_cluster\_create\_timeouts) | Timeout for creating the cluster. | `string` | `"30m"` | no |
| <a name="input_cluster_delete_timeouts"></a> [cluster\_delete\_timeouts](#input\_cluster\_delete\_timeouts) | Timeout for deleting the cluster. | `string` | `"30m"` | no |
| <a name="input_cluster_update_timeouts"></a> [cluster\_update\_timeouts](#input\_cluster\_update\_timeouts) | Timeout for updating the cluster. | `string` | `"30m"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The minimum version of the master | `string` | `"1.27"` | no |
| <a name="input_csi_secrets_store_enabled"></a> [csi\_secrets\_store\_enabled](#input\_csi\_secrets\_store\_enabled) | Specify whether the CSI driver is enabled | `bool` | `false` | no |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | Size of the disk in gigabytes for each node in the cluster. | `number` | `10` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | Type of disk to use for the nodes in the cluster. | `string` | `""` | no |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Name of the resource. Provided by the client when the resource is created. | `string` | `""` | no |
| <a name="input_image_type"></a> [image\_type](#input\_image\_type) | Type of image to use for the nodes in the cluster. | `string` | `""` | no |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | The number of nodes to create in this cluster's default node pool. | `number` | `0` | no |
| <a name="input_kms_enabled"></a> [kms\_enabled](#input\_kms\_enabled) | Specify whether the redis cluster is enabled | `bool` | `false` | no |
| <a name="input_kubectl_config_path"></a> [kubectl\_config\_path](#input\_kubectl\_config\_path) | Path to the kubectl config file. Defaults to $HOME/.kube/config | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | The location (region or zone) in which the cluster master will be created, as well as the default node location. | `string` | `""` | no |
| <a name="input_location_policy"></a> [location\_policy](#input\_location\_policy) | Specifies the policy for distributing nodes across locations, with the default being BALANCED | `string` | `"BALANCED"` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Specifies the machine type for the nodes in the cluster. | `string` | `""` | no |
| <a name="input_max_node_count"></a> [max\_node\_count](#input\_max\_node\_count) | Maximum number of nodes in the cluster. | `number` | `1` | no |
| <a name="input_min_master_version"></a> [min\_master\_version](#input\_min\_master\_version) | The minimum version of the master. | `string` | `""` | no |
| <a name="input_min_node_count"></a> [min\_node\_count](#input\_min\_node\_count) | Minimum number of nodes in the cluster. | `number` | `1` | no |
| <a name="input_preemptible"></a> [preemptible](#input\_preemptible) | Specifies whether the nodes in the cluster should be preemptible. | `bool` | `false` | no |
| <a name="input_project"></a> [project](#input\_project) | The Google project that will host the cluster | `string` | n/a | yes |
| <a name="input_redis_enabled"></a> [redis\_enabled](#input\_redis\_enabled) | Specify whether the redis cluster is enabled | `bool` | `false` | no |
| <a name="input_redis_ha_enabled"></a> [redis\_ha\_enabled](#input\_redis\_ha\_enabled) | Specify whether HA is enabled for redis | `bool` | `false` | no |
| <a name="input_redis_memory_in_gb"></a> [redis\_memory\_in\_gb](#input\_redis\_memory\_in\_gb) | Redis memory size in GiB | `number` | `1` | no |
| <a name="input_region"></a> [region](#input\_region) | The location (region or zone) in which the cluster master will be created | `string` | `""` | no |
| <a name="input_remove_default_node_pool"></a> [remove\_default\_node\_pool](#input\_remove\_default\_node\_pool) | deletes the default node pool upon cluster creation. | `bool` | `true` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | The Google Cloud Platform Service Account to be used by the node VMs created by GKE Autopilot or NAP. | `string` | `""` | no |
| <a name="input_sql_enabled"></a> [sql\_enabled](#input\_sql\_enabled) | Specify whether the sql instance is enabled | `bool` | `false` | no |
| <a name="input_sql_engine"></a> [sql\_engine](#input\_sql\_engine) | The sql version to use | `string` | `"POSTGRES_15"` | no |
| <a name="input_sql_instance_class"></a> [sql\_instance\_class](#input\_sql\_instance\_class) | The machine type to use | `string` | `"db-f1-micro"` | no |
| <a name="input_sql_master_password"></a> [sql\_master\_password](#input\_sql\_master\_password) | The password for the db user | `string` | `""` | no |
| <a name="input_sql_master_username"></a> [sql\_master\_username](#input\_sql\_master\_username) | The name of the db user | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Terraform map to create custom tags for the Google resources | `map` | `{}` | no |
## Resources

| Name | Type |
|------|------|
| [google_compute_global_address.private_ip_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_network.network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_router.nat_router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.nat_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_container_cluster.primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_kms_crypto_key.key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key) | resource |
| [google_kms_key_ring.keyring](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_ring) | resource |
| [google_redis_instance.cache](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance) | resource |
| [google_service_networking_connection.private_vpc_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |
| [google_sql_database_instance.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [helm_release.csi_secrets_store](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [null_resource.configure_kubectl](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.csi_secrets_store_aws_provider](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.sql_vpc_lock](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_id.server](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [http_http.csi_secrets_store_gcp_provider](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_vpc_network"></a> [private\_vpc\_network](#output\_private\_vpc\_network) | n/a |
| <a name="output_sql_database"></a> [sql\_database](#output\_sql\_database) | n/a |
# 🚀 Built by opsZero!

<a href="https://opszero.com"><img src="https://opszero.com/img/common/opsZero-Logo-Large.webp" width="300px"/></a>

[opsZero](https://opszero.com) provides software and consulting for Cloud + AI. With our decade plus of experience scaling some of the world’s most innovative companies we have developed deep expertise in Kubernetes, DevOps, FinOps, and Compliance.

Our software and consulting solutions enable organizations to:

- migrate workloads to the Cloud
- setup compliance frameworks including SOC2, HIPAA, PCI-DSS, ITAR, FedRamp, CMMC, and more.
- FinOps solutions to reduce the cost of running Cloud workloads
- Kubernetes optimized for web scale and AI workloads
- finding underutilized Cloud resources
- setting up custom AI training and delivery
- building data integrations and scrapers
- modernizing onto modern ARM based processors

We do this with a high-touch support model where you:

- Get access to us on Slack, Microsoft Teams or Email
- Get 24/7 coverage of your infrastructure
- Get an accelerated migration to Kubernetes

Please [schedule a call](https://calendly.com/opszero-llc/discovery) if you need support.

<br/><br/>

<div style="display: block">
  <img src="https://opszero.com/img/common/aws-advanced.png" alt="AWS Advanced Tier" width="150px" >
  <img src="https://opszero.com/img/common/aws-devops-competency.png" alt="AWS DevOps Competency" width="150px" >
  <img src="https://opszero.com/img/common/aws-eks.png" alt="AWS EKS Delivery" width="150px" >
  <img src="https://opszero.com/img/common/aws-public-sector.png" alt="AWS Public Sector" width="150px" >
</div>
<!-- END_TF_DOCS -->