project_id                     = "tudublin"
cluster_name                   = "tud-eu-west1-cluster"
region                         = "europe-west1"
zones                          = [ "europe-west1-b" ]
kubernetes_version             = "latest"
release_channel                = "STABLE"
subnet_ip_range                = "10.10.0.0/16"
pod_ip_range                   = "10.20.0.0/16"
service_ip_range               = "10.30.0.0/16"
service_account                = "gke-staging@tudublin.iam.gserviceaccount.com"
machine_type                   = "e2-standard-2"
min_count                      = 1
max_count                      = 10
disk_size_gb                   = 50
initial_node_count             = 8
