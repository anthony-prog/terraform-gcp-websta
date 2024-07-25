output "bucket_name" {
  description = "Nombre del bucket de almacenamiento"
  value       = google_storage_bucket.bucket.name
}

output "static_website_url" {
  description = "URL del sitio web estático alojado en el bucket"
  value       = "https://storage.googleapis.com/${google_storage_bucket.bucket.name}/index.html"
}

output "error_page_url" {
  description = "URL de la página de error del sitio web estático"
  value       = "https://storage.googleapis.com/${google_storage_bucket.bucket.name}/error.html"
}

output "cors_rules" {
  description = "Reglas CORS aplicadas al bucket"
  value       = google_storage_bucket.bucket.cors
}