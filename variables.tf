variable "project_id" {
  default = "imposing-voyage-428312-c8"
  description = "El ID del proyecto de GCP"
  type        = string
}

variable "region" {
  default = "southamerica-east1"
  description = "La región de GCP para desplegar los recursos"
  type        = string

}

variable "bucket_name" {
  default = "anthony12-2"
  description = "El nombre del Storage Bucket. Debe ser único."
  type        = string
}

variable "labels" {
  description = "Etiquetas para asignar al storage bucket."
  type        = map(string)
  default     = {}
}

variable "cors_rules" {
  description = "List of CORS rules."
  type = list(object({
    origin          = list(string)
    method          = list(string)
    response_header = list(string)
    max_age_seconds = number
  }))
  default = [
    {
      origin          = ["*"]
      method          = ["GET", "POST"]
      response_header = ["Content-Type"]
      max_age_seconds = 3600
    }
  ]
}