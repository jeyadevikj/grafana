variable "grafana_image" {
  type = string
  default = "grafana/grafana:latest"
  description = "Grafana Docker image"
}

variable "grafana_storage_size" {
  type = string
  default = "1Gi"
  description = "Storage size for Grafana data (optional)"
}


# Add other variables for resource requests/limits, security context, etc.
