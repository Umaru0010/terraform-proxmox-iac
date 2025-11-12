# Создание виртуальной машины в Proxmox
resource "proxmox_vm_qemu" "infrastructure_vm" {
  # Основные параметры ВМ
  vmid        = var.vm_id        # Уникальный ID виртуальной машины
  name        = var.vm_name      # Имя ВМ в интерфейсе Proxmox
  target_node = var.target_node  # Узел кластера для размещения
  
  # Ресурсы ВМ
  cores  = var.vm_cores   # Количество CPU ядер
  memory = var.vm_memory  # Объем RAM в МБ
  agent  = 1              # Включить QEMU Guest Agent
  
  # Системный диск
  disk {
    slot    = "scsi0"           # Слот диска (scsi0, virtio0)
    size    = var.vm_disk_size  # Размер диска (8G, 20G)
    storage = "local-lvm"       # Хранилище данных
    type    = "disk"            # Тип: disk, cdrom, cloudinit
  }
  
  # Сетевой интерфейс
  network {
    id     = 0           # ID сетевого устройства
    model  = "virtio"    # Модель сетевой карты
    bridge = "vmbr0"     # Сетевой мост
  }
  
  # Настройки загрузки
  boot   = "order=scsi0"  # Загрузка с системного диска
  onboot = true           # Автозапуск при старте хоста
}

# Вывод информации о созданной ВМ
output "vm_info" {
  value = {
    name = proxmox_vm_qemu.infrastructure_vm.name    # Имя ВМ
    id   = proxmox_vm_qemu.infrastructure_vm.vmid    # ID ВМ
    node = proxmox_vm_qemu.infrastructure_vm.target_node  # Узел размещения
  }
}
