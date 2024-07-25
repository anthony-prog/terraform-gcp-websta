provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "bucket" {
  name           = var.bucket_name
  location       = var.region
  force_destroy  = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "error.html"
  }

  dynamic "cors" {
    for_each = var.cors_rules
    content {
      origin          = cors.value.origin
      method          = cors.value.method
      response_header = cors.value.response_header
      max_age_seconds = cors.value.max_age_seconds
    }
  }

  labels = var.labels
}

resource "google_storage_bucket_object" "index" {
  name   = "index.html"
  bucket = google_storage_bucket.bucket.name
  source = "www/index.html"
}

resource "google_storage_bucket_object" "error" {
  name   = "error.html"
  bucket = google_storage_bucket.bucket.name
  source = "www/error.html"
}

resource "google_storage_bucket_iam_binding" "public_rule" {
  bucket = google_storage_bucket.bucket.name

  role    = "roles/storage.objectViewer"
  members = [
    "allUsers",
  ]
}
