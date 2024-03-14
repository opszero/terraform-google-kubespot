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
# Pro Support

<a href="https://www.opszero.com"><img src="https://media.opszero.com/insights/brands/logo/2023/04/26/02/04/12/opsZero_logo.svg" width="300px"/></a>

[opsZero provides support](https://www.opszero.com/devops) for our modules including:

-   Slack & Email support
-   One on One Video Calls
-   Implementation Guidance
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
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The minimum version of the master | `string` | `"1.27"` | no |
| <a name="input_csi_secrets_store_enabled"></a> [csi\_secrets\_store\_enabled](#input\_csi\_secrets\_store\_enabled) | Specify whether the CSI driver is enabled | `bool` | `true` | no |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | The name of the environment to create resources | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The Google Project that will host the cluster | `string` | n/a | yes |
| <a name="input_redis_enabled"></a> [redis\_enabled](#input\_redis\_enabled) | Specify whether the redis cluster is enabled | `bool` | `false` | no |
| <a name="input_redis_ha_enabled"></a> [redis\_ha\_enabled](#input\_redis\_ha\_enabled) | Specify whether HA is enabled for redis | `bool` | `false` | no |
| <a name="input_redis_memory_in_gb"></a> [redis\_memory\_in\_gb](#input\_redis\_memory\_in\_gb) | Redis memory size in GiB | `number` | `1` | no |
| <a name="input_region"></a> [region](#input\_region) | The location (region or zone) in which the cluster master will be created | `string` | `"us-central1"` | no |
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
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_container_cluster.cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_kms_crypto_key.key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key) | resource |
| [google_kms_key_ring.keyring](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_ring) | resource |
| [google_redis_instance.cache](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance) | resource |
| [google_service_networking_connection.private_vpc_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |
| [google_sql_database_instance.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [helm_release.csi_secrets_store](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [null_resource.csi_secrets_store_aws_provider](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.sql_vpc_lock](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_id.server](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [http_http.csi_secrets_store_gcp_provider](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_vpc_network"></a> [private\_vpc\_network](#output\_private\_vpc\_network) | n/a |
| <a name="output_sql_database"></a> [sql\_database](#output\_sql\_database) | n/a |
<!-- END_TF_DOCS -->
