# Домашнее задание к занятию «Организация сети» - Семикова Т.В. FOPS-9

### Подготовка к выполнению задания

1. Домашнее задание состоит из обязательной части, которую нужно выполнить на провайдере Yandex Cloud, и дополнительной части в AWS (выполняется по желанию). 
2. Все домашние задания в блоке 15 связаны друг с другом и в конце представляют пример законченной инфраструктуры.  
3. Все задания нужно выполнить с помощью Terraform. Результатом выполненного домашнего задания будет код в репозитории. 
4. Перед началом работы настройте доступ к облачным ресурсам из Terraform, используя материалы прошлых лекций и домашнее задание по теме «Облачные провайдеры и синтаксис Terraform». Заранее выберите регион (в случае AWS) и зону.

---
### Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.
 - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
 - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
 - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.

### Ответ
```bash
yandex_vpc_network.network-1: Creating...
yandex_vpc_network.network-1: Creation complete after 2s [id=enpqsnius624ata7c4tb]
yandex_vpc_subnet.subnet-public: Creating...
yandex_vpc_subnet.subnet-public: Creation complete after 1s [id=e9b3egsj34t6r2kvk683]
yandex_compute_instance.nat-instance: Creating...
yandex_compute_instance.public-vm: Creating...
yandex_compute_instance.nat-instance: Still creating... [10s elapsed]
yandex_compute_instance.public-vm: Still creating... [10s elapsed]
yandex_compute_instance.nat-instance: Still creating... [20s elapsed]
yandex_compute_instance.public-vm: Still creating... [20s elapsed]
yandex_compute_instance.nat-instance: Still creating... [30s elapsed]
yandex_compute_instance.public-vm: Still creating... [30s elapsed]
yandex_compute_instance.public-vm: Creation complete after 38s [id=fhmm2hqtii7uf7ncc76j]
yandex_compute_instance.nat-instance: Still creating... [40s elapsed]
yandex_compute_instance.nat-instance: Creation complete after 44s [id=fhm15qnme6tk6lc79ev8]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_nat_vm = "158.160.118.112"
external_ip_address_public_vm = "158.160.62.103"
internal_ip_address_nat_vm = "192.168.10.254"
internal_ip_address_public_vm = "192.168.10.22"
```

![image](https://github.com/SemikovaTV/hw_cloudpro/assets/129278233/aaba98d5-21a2-4e67-8dd8-fa3cae005284)

![image](https://github.com/SemikovaTV/hw_cloudpro/assets/129278233/adf1cfcb-49b3-466e-9f56-7e570304929d)

Проверяем, что у виртуальной машины есть доступ во внешнюю сеть:

![image](https://github.com/SemikovaTV/hw_cloudpro/assets/129278233/d7a23df1-ea1f-4c6e-b7bc-c4f0f66f2444)

3. Приватная подсеть.
 - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
 - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
 - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.

### Ответ
```bash
Apply complete! Resources: 5 added, 0 changed, 2 destroyed.

Outputs:

external_ip_address_nat_vm = "178.154.222.196"
external_ip_address_public_vm = "158.160.101.174"
internal_ip_address_nat_vm = "192.168.10.254"
internal_ip_address_public_vm = "192.168.10.23"
```

![image](https://github.com/SemikovaTV/hw_cloudpro/assets/129278233/e47ecb9c-7552-4e0f-bdbf-5ce4e5403b06)

![image](https://github.com/SemikovaTV/hw_cloudpro/assets/129278233/dbab4c2f-ea6f-4bed-ba5c-ee7da2423681)

Подключаемся и проверяем доступ к интернету:

![image](https://github.com/SemikovaTV/hw_cloudpro/assets/129278233/e91a0159-c5a2-438b-b8c4-1ed178c10b48)


[terraform](https://github.com/SemikovaTV/hw_cloudpro/tree/main/terraform)

Resource Terraform для Yandex Cloud:

- [VPC subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet).
- [Route table](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_route_table).
- [Compute Instance](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance).

