variable "proxmox_host" {
  description = "IP адрес Proxmox сервера"
  type        = string
  sensitive   = true
}

variable "proxmox_user" {
  description = "Пользователь Proxmox"
  type        = string
  sensitive   = true
}

variable "proxmox_password" {
  description = "Пароль пользователя"
  type        = string
  sensitive   = true
}

variable "vm_id" {
  description = "ID виртуальной машины"
  type        = number
  default     = 91001
}

variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
  default     = "terraform-vm"
}

variable "vm_cores" {
  description = "Количество ядер CPU"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Объем оперативной памяти (МБ)"
  type        = number
  default     = 2048
}

variable "vm_disk_size" {
  description = "Размер диска"
  type        = string
  default     = "20G"
}

variable "target_node" {
  description = "Целевой узел Proxmox"
  type        = string
  default     = "pve"
}
