locals {
  name = "${var.projectname}-${var.Environment}"
  current_time = formatdate("YYYY-MM-DD-hh-mm", timestamp())
}