variable "region" {
    type = string
    description = "regiao aws"
    default = "us-east-2"
}

variable "owner" {
  description = "Dono do bucket"
  type = string
  default = "marcelo.makoto"
}

variable "department" {
  description = "Departamento"
  type = string
  default = "Academy"
}

variable "az1" {
    description = "Zona de disponibilidade"
    type = string
    default = "us-east-2a"
}

variable "az2" {
    description = "Zona de disponibilidade"
    type = string
    default = "us-east-2b"
}