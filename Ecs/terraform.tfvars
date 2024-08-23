# General Configuration
cluster_name     = "my-ecs-cluster"
task_family      = "my-task-family"
container_name   = "my-container"
ecr_repository   = "devops"
image_tag        = "77b6b36fb7aff1888ff84de68ccc334a23d1097a" # Replace with the actual image tag you pushed, e.g., "sha256:abc123"
service_name     = "my-ecs-service"
cpu              = "256"
memory           = "512"
desired_count    = 1

# cidr_block     = "10.0.0.0/16"


