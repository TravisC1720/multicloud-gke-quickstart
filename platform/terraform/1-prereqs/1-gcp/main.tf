module "gcp" {
  source = "../../../tfm/1-prereqs/1-gcp/"
  storageBucketName = "private-edition-bucket"
  location = "us-east1"
  project_id = "travisgkepequickstart"
  user = "serviceAccount:484389204278@cloudbuild.gserviceaccount.com"
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