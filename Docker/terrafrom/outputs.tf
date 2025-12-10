# Output database container info
output "db_container_info" {
  value = {
    name      = docker_container.student_db.name
    host_port = docker_container.student_db.ports[0].external
    internal_port = docker_container.student_db.ports[0].internal
  }
}

# Output backend container info
output "backend_container_info" {
  value = {
    name      = docker_container.student_backend.name
    host_port = docker_container.student_backend.ports[0].external
    internal_port = docker_container.student_backend.ports[0].internal
  }
}

# Output frontend container info
output "frontend_container_info" {
  value = {
    name      = docker_container.student_frontend.name
    host_port = docker_container.student_frontend.ports[0].external
    internal_port = docker_container.student_frontend.ports[0].internal
  }
}

# Output frontend URL for browser
output "frontend_url" {
  value = "http://localhost:${docker_container.student_frontend.ports[0].external}"
}

# Output backend URL for browser (Tomcat)
output "backend_url" {
  value = "http://localhost:${docker_container.student_backend.ports[0].external}"
}

