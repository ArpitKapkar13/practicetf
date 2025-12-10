# ---------------- Terraform provider ----------------
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6"
    }
  }
}

provider "docker" {}

# ---------------- Database ----------------
resource "docker_container" "student_db" {
  name  = "student-db"
  image = "mysql:5.7"

  env = [
    "MYSQL_ROOT_PASSWORD=root",
    "MYSQL_DATABASE=studentdb",
    "MYSQL_USER=admin",
    "MYSQL_PASSWORD=admin"
  ]

  ports {
    internal = 3306
    external = 3307   # avoid host MySQL conflicts
  }
}

# ---------------- Backend ----------------
resource "docker_image" "student_backend" {
  name = "student_backend:latest"

  build {
    context = "${path.module}/../DockerImage_studentapp_threetier-main/Backend"
  }
}

resource "docker_container" "student_backend" {
  name  = "student-backend"
  image = docker_image.student_backend.name
  depends_on = [docker_container.student_db]

  ports {
    internal = 8080
    external = 8080
  }
}

# ---------------- Frontend ----------------
resource "docker_image" "student_frontend" {
  name = "student_frontend:latest"

  build {
    context = "${path.module}/../DockerImage_studentapp_threetier-main/Frontend"
  }
}

resource "docker_container" "student_frontend" {
  name  = "student-frontend"
  image = docker_image.student_frontend.name
  depends_on = [docker_container.student_backend]

  ports {
    internal = 80
    external = 3000
  }
}

