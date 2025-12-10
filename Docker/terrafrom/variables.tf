# Ports for database, backend, frontend
variable "db_port" {
  description = "Host port for MySQL container"
  type        = number
  default     = 3307
}

variable "backend_port" {
  description = "Host port for backend Tomcat container"
  type        = number
  default     = 8080
}

variable "frontend_port" {
  description = "Host port for frontend container"
  type        = number
  default     = 3000
}

