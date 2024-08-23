variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "cluster_id" {
  description = "The ID of the ECS cluster"
  type        = string
}

variable "task_definition" {
  description = "The ARN of the ECS task definition"
  type        = string
}

variable "desired_count" {
  description = "The desired number of tasks to run"
  type        = number
}

variable "subnets" {
  description = "The subnets associated with the ECS service"
  type        = list(string)
}

variable "security_groups" {
  description = "The security groups associated with the ECS service"
  type        = list(string)
}



variable "task_family" {}
variable "cpu" {}
variable "memory" {}
variable "container_name" {}
variable "image_tag" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
variable "target_group_arn" {}
variable "cluster_name" {
  default = "my-cluster"
}
variable "alb_listener_arn" {}
variable "task_definition_arn" {
}