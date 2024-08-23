variable "cluster_name" {
  default = "my-ecs-cluster"
}

variable "task_family" {
  default = "my-task-family"
}

variable "container_name" {
  default = "my-container"
}

variable "ecr_repository" {
  default = "devops"
}

variable "image_tag" {
  description = "The tag of the Docker image to deploy"
  default     = "latest"
}

variable "service_name" {
  default = "my-ecs-service"
}

variable "cpu" {
  default = "256"
}

variable "memory" {
  default = "512"
}

variable "desired_count" {
  default = 1
}


# variable "subnet_ids" {
#   # type = list(string)
# }
# variable "security_group_ids" {
#   # type = list(string)
# }
variable "listener_port" {
  default = 80
}
variable "health_check_path" {
  default = "/"
}