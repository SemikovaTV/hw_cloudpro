variable "yandex_cloud_id" {
  default = "b1g4m8qmhdgh8k9b16jr"
}

variable "yandex_folder_id" {
  default = "b1gmuide8sg5l7lprdbm"
}

variable "a-zone" {
  default = "ru-central1-a"
}

variable "vm_os_family" {
  type	      = string
  default     = "ubuntu-2004-lts"
  description = "image family vm1"
}

variable "lamp-instance-image-id" {
  default = "fd827b91d99psvq5fjit"
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
















