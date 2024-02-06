 variable "common_tags" {
    default = {
        project = "roboshop"
        Environment = "dev"
        Terraform = "true"
    }
}
variable "tags" {
    default = {
        Component = "catalogue"
    }
  
}
variable "projectname" {
    default = "roboshop"
  
}
variable "Environment" {
    default = "dev"
}
variable "zone_name" {
    default = "awsdevops.website"
}
variable "app_version" {
  
}