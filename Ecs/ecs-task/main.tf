
data "aws_ecr_repository" "repo" {
  name = var.ecr_repository
}

resource "aws_ecs_task_definition" "task" {
  family                   = var.task_family
  execution_role_arn   = "arn:aws:iam::248837216935:role/ecsTaskExecutionRole"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory

  container_definitions = jsonencode([{
    name      = var.container_name
    image = "${data.aws_ecr_repository.repo.repository_url}:${var.image_tag}"
    essential = true

    portMappings = [{
      containerPort = 5000
      hostPort      = 5000
    }]
  }])
}






output "task_definition_arn" {
  value = aws_ecs_task_definition.task.arn
}
