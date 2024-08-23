variable "task_family" {
  description = "The family of the ECS task definition"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "ecr_repository" {
  description = "The name of the ECR repository"
  type        = string
}

variable "image_tag" {
  description = "The tag of the Docker image to deploy"
  type        = string
}

variable "cpu" {
  description = "The number of CPU units to allocate to the task"
  type        = string
}

variable "memory" {
  description = "The amount of memory (in MiB) to allocate to the task"
  type        = string
}
