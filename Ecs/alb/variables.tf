variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
variable "listener_port" {
  default = 80
}
variable "health_check_path" {
  default = "/"
}
