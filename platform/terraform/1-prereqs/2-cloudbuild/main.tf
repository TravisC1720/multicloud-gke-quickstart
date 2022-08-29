module "cloudbuild" {
  source = "../../../tfm/1-prereqs/2-cloudbuild/"
  project_id = "travisgkepequickstart"
  gkeregionprimary = "us-east1"
  gkeregionsecondary = "us-central1"
  gkecluster = "general-cluster"
  fqdn = "privateedition.genesyssc13.com"
  emailaddress = "travis.coleman@genesys.com"
  storageBucketName = "private-edition-bucket"
  githubURL = "https://github.com/TravisC1720/multicloud-gke-quickstart"
  helmRepoURL = "oci://us-east1-docker.pkg.dev/travisgkepequickstart/genesys-multicloud-pe-charts"
  containerRegistryURL = "us-east1-docker.pkg.dev/travisgkepequickstart/genesys-multicloud-pe-images"
  repoid = "genesys-multicloud-pe"
  remotehelm = "https://pureengageuse1.jfrog.io/artifactory/api/helm/helm-multicloud" 
  remoterepo = "pureengageuse1-docker-multicloud.jfrog.io"
  remoteuser = "demo-user"
  remotepass = "Genesys1"
}

provider "google" {
  project = "travisgkepequickstart"
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.29.0"
    }
  }

  required_version = "= 1.2.6"
}

terraform {
  backend "gcs" {
    bucket = "private-edition-bucket"
    prefix = "base-state"
  }
}