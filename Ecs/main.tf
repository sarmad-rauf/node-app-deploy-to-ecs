provider "aws" {
  region = "us-east-1"
 
}

module "vpc" {
  source = "./vpc"
}

module "ecs_cluster" {
  source       = "./ecs-cluster"
  cluster_name = var.cluster_name
}

module "ecs_task" {
  source             = "./ecs-task"
  task_family        = var.task_family
  container_name     = var.container_name
  ecr_repository     = var.ecr_repository
  image_tag          = var.image_tag
  cpu                = var.cpu
  memory             = var.memory
  
}

module "ecs_service" {
  source             = "./ecs-service"
  cluster_id         = module.ecs_cluster.cluster_id
  task_definition    = module.ecs_task.task_definition_arn
  service_name       = var.service_name
  desired_count      = var.desired_count
  subnets            = module.vpc.subnet_ids
  security_groups    = [module.vpc.default_security_group_id]


  task_family        = var.task_family
  cpu                = var.cpu
  memory             = var.memory
  container_name     = var.container_name
  image_tag          = var.image_tag
  cluster_name       = var.cluster_name
  subnet_ids         = module.vpc.subnet_ids
  security_group_ids = [module.alb.alb_security_group_id]
  target_group_arn   = module.alb.target_group_arn
   alb_listener_arn    = module.alb.alb_listener_arn
   task_definition_arn = module.ecs_task.task_definition_arn
}

module "alb" {
  source = "./alb"

  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.subnet_ids
  security_group_ids = [module.alb.alb_security_group_id]
  health_check_path = var.health_check_path
  listener_port     = var.listener_port
}

data "aws_ecr_repository" "repo" {
  name = var.ecr_repository
}