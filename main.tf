provider "aws" {
  region = var.region
}

resource "aws_ecs_service" "service" {
  name            = var.service.name
  desired_count   = var.service.count

  cluster         = var.cluster
  task_definition = var.td

  launch_type     = "EC2"

  deployment_maximum_percent = var.service.maxperc
  deployment_minimum_healthy_percent = var.service.minperc

  wait_for_steady_state = true
}