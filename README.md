# Введение

Основные параметры такие как region имена сети и кластера, правятся в 1_vpc/variables.tf !!!<br>

<details><summary>0. ## Подготовительные операции</summary>
<p>

0.1 Создать в аккаунте AWS bucket для хранения terraform.tfstate:<br>
```
aws s3api create-bucket --bucket "terraform-states-0714" --region "eu-central-1" --create-bucket-configuration LocationConstraint="eu-central-1"
aws s3api put-bucket-versioning --bucket "terraform-states-0714" --versioning-configuration Status=Enabled
```
0.2 Перейти в папку 0_s3 и произвести инициализацию и создать необходимую обвязку<br>
```
terraform init
terraform apply --auto-approve
```
PS. Если возникла ошибка "* ResourceNotFoundException: Requested resource not found" выполнить команду:<br>
```
terraform apply --auto-approve -lock=false
```

0.3 После успешного завершения перейти к шагу 1.<br>

</p>
</details>

<details><summary>1. ## Создание AWS сети с VPN</summary>
<p>

1.1 Написать в Support заявку на выделение IP Address CIDR (минимальная маска /27).<br>
1.2 После указания внести изменения в 1_vpc/variables.tf в variable "cidr" и разбить его на две подсети в variable "private_subnets".<br>
1.3 Затем инициализировать репозиторий 1_vpc и создать в AWS сеть и сабнеты командами:<br>
```
cd 1_vpc
terraform init
terraform apply
```
1.4 После поднятия сети и сабнетов, нужно создать Create transit gateway attachment in AWS VPC для созданной VPC id к Transit gateway и запросить в той же заявке его активацию.<br>
1.5 Проверить что была создана 'default VPC security group' в созданной VPC id, если нет запросить ее создание в этой же заявке.<br>

</p>
</details>

<details><summary>2. ## Создание EKS кластера в сети с VPN</summary>
<p>

2.1 После создания/получения статуса сети - 1_vpc/terraform.tfstate можно создавать кластер.<br>
PS. Надо проверить и при необходимости исправить параметры в 2_eks/terraform.tfvars, в частности, вписать id 'default VPC security group' в переменную sg.<br>
```
cd 2_eks
terraform init
terraform apply
```

</p>
</details>