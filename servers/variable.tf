variable "hash_commit" {
  default     = "806d52dafe9b7fddbc4f0d2d41086ed3cfa02a44"
  description = "the commit of gomex ubuntu public image"
}

variable "servers" {
}

/* variable "instance_type" {
  default = "t2.micro"
} */

variable "instance_type" {
  type        = list(string)
  //default     = ["t2.micro","t3.medium"]
  default     = ["t2.micro"]
  description = "The list of instance types"
}


variable "environment" {
  type        = string
  default     = "staging"
  description = "The environment of instance"
}

variable "sg" {
  type        = list(string)
  default     = ["sg-0ed0bbdc765b2da79"]
  description = "The list of sg for this instance"
}

//we define the variable for the module
variable "blocks" {
   type      = list(object({
    device_name = string
    volume_size = string
    volume_type = string
  }))
}

variable "name" {
  type        = string
  default     = "vivisima"
  description = "name in the hello world string"
}
