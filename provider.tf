provider "google" {
  project = "project_id"
  region  = "us-east1"
}

provider "helm" {
  kubernetes {
    # load_config_file = false
    config_path = "~/.kube/config"
  }
}