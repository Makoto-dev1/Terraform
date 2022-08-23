variable "region" {
  type        = string
  description = "regiao aws"
  default     = "us-east-2"
}

variable "owner" {
  description = "Dono da VPC"
  type        = string
  default     = "marcelo.makoto"
}

variable "department" {
  description = "Departamento"
  type        = string
  default     = "Academy"
}

variable "az1" {
  description = "Zona de disponibilidade"
  type        = string
  default     = "us-east-2a"
}

variable "az2" {
  description = "Zona de disponibilidade"
  type        = string
  default     = "us-east-2b"
}

variable "cidr_block_VPC" {
  description = "cidr VPC"
  type        = string
  default     = "10.0.0.0/16"
}