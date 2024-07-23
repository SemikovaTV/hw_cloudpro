# Домашнее задание к занятию «Вычислительные мощности. Балансировщики нагрузки»  

### Подготовка к выполнению задания

1. Домашнее задание состоит из обязательной части, которую нужно выполнить на провайдере Yandex Cloud, и дополнительной части в AWS (выполняется по желанию). 
2. Все домашние задания в блоке 15 связаны друг с другом и в конце представляют пример законченной инфраструктуры.  
3. Все задания нужно выполнить с помощью Terraform. Результатом выполненного домашнего задания будет код в репозитории. 
4. Перед началом работы настройте доступ к облачным ресурсам из Terraform, используя материалы прошлых лекций и домашних заданий.

---
## Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.

![image](https://github.com/user-attachments/assets/1a2be58f-76ad-463a-b6f1-631a87c5d085)


![image](https://github.com/user-attachments/assets/2f82566b-78a6-4d94-9807-77754ab380e3)


### Файл доступен к скачиванию по сслыке: [test.jpg](http://semikova-netology-bucket.storage.yandexcloud.net/test.jpg)

 
2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.

![image](https://github.com/user-attachments/assets/4d10366b-bb85-41f5-bf5f-fe1de4899117)

Изображение из бакета доступно на виртуальной машине:

![image](https://github.com/user-attachments/assets/7ac300c9-c8f9-432d-9728-4227ee76a72a)


 
3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.

![image](https://github.com/user-attachments/assets/fba4f614-296a-4ff6-9104-0931ffa44489)

Удаляем одну машиину:

![image](https://github.com/user-attachments/assets/c9319793-f769-4fac-8261-f951c76de225)

Изображение из bucket доступно по адресу load balancer:

![image](https://github.com/user-attachments/assets/cd23c4f0-aa66-4067-9b0a-7d2d86e3f582)

Машина восстановлена:

![image](https://github.com/user-attachments/assets/1c2c91e3-d211-4833-af72-54991a8b9ef6)


[Ссылка на файлы конфигурации](https://github.com/SemikovaTV/hw_cloudpro/tree/main/bucket)


Полезные документы:

- [Compute instance group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance_group).
- [Network Load Balancer](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_network_load_balancer).
- [Группа ВМ с сетевым балансировщиком](https://cloud.yandex.ru/docs/compute/operations/instance-groups/create-with-balancer).

---
