output "cluster_id" {
  value = module.ecs_cluster.cluster_id
}

output "task_definition_arn" {
  value = module.ecs_task.task_definition_arn
}

output "service_name" {
  value = module.ecs_service.service_name
}
