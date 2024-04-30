
data "google_client_config" "default" {}
 
data "google_container_cluster" "gke_cluster" {
  name     = "harshautopilot-cluster-1"
  location = "us-central1"
  project  = "moonlit-ceiling-420006"
}

provider "google" {
  #credentials = jsondecode(base64decode(var.credentials_json))
  project     = "moonlit-ceiling-420006"
  region      = "us-central1"
}
 
provider "kubernetes" {
  host                   = data.google_container_cluster.gke_cluster.endpoint
  client_certificate     = base64decode(data.google_container_cluster.gke_cluster.master_auth.0.client_certificate)
  client_key             = base64decode(data.google_container_cluster.gke_cluster.master_auth.0.client_key)
  cluster_ca_certificate = base64decode(data.google_container_cluster.gke_cluster.master_auth.0.cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}
