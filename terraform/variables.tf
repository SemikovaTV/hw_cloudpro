variable "yandex_cloud_id" {
  default = "b1g4m8qmhdgh8k9b16jr"
}

variable "yandex_folder_id" {
  default = "b1gmuide8sg5l7lprdbm"
}

variable "a-zone" {
  default = "ru-central1-a"
}

variable "nat-instance-image-id" {
  default = "fd80mrhj8fl2oe87o4e1"
}

variable "nat-instance-ip" {
  default = "192.168.10.254"
}

variable "vm_os_family" {
  type	      = string
  default     = "ubuntu-2004-lts"
  description = "image family vm1"
}

variable "domain" {
  default = "netology"
}

variable "nat-instance-name" {
  default = "nat-instance-vm1"
}

variable "public-vm-name" {
  default = "vm-public"
}

variable "private-vm-name" {
  default = "vm-private"
}



###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}
variable "cloud_id" {
  type        = string
  default     = "b1gtjbhddcg1kjt1rjel"
}

variable "folder_id" {
  type        = string
  default     = "b1gmuide8sg5l7lprdbm"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
}
















