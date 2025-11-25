variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "images" {
    default = ["catalogue", "user", "cart", "shipping", "payment", "frontend"]
}
