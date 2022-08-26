# terraform_ecs_td

Terraform module to create a service based on task definition in ECS cluster

##  Dependencies

ECS Cluster - <https://github.com/virsas/terraform_ecs_cluster>
ECS Task definition - <https://github.com/virsas/terraform_ecs_td>

## Files

- None

## Terraform example

``` terraform
##############
# Variable
##############
variable "ecs_service_example_api" {
  default = {
    name = "example_api"
    count = 2
    minperc = 50
    maxperc = 100
  }
}

##############
# Module
##############
module "ecs_service_example_api" {
  source = "git::https://github.com/virsas/terraform_ecs_service.git?ref=v1.0.0"
  service = var.ecs_service_example_api
  cluster = module.ecs_cluster_apis.id
  td      = module.ecs_td_example_api.arn
}
```

## Outputs

- name