# terraform-pratice
Repositório para gerência de configuração dos scripts elaborados durante o estudo de Terraform

## Passos para deploy de uma infra com Terraform

1. Escopo: Definir o escopo da infraestrutura
2. Autoral: Escrever a configuração para definir sua infraestrutura
3. Inicialização: Instalar os providers requiridos pelo Terraform
4. Plano: Prever as mudanças que o Terraform irá fazer
5. Aplicação: Executa as mudanças em sua infraestrutura

[Build Infrastructure - Terraform AWS Example | Terraform - HashiCorp Learn](https://learn.hashicorp.com/tutorials/terraform/aws-build)

[Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Comandos

```bash
terraform init #inicializa o terraform no diretório
terraform plan #mostra baseado no arquivo, todo o plano que será feito
terraform apply #aplica o plano que ele apresentou
terraform destroy #destroi toda a infraestrutura criada
terraform fmt #Formate sua configuração. O Terraform imprimirá os nomes dos arquivos modificados, se houver. Nesse caso, seu arquivo de configuração já foi formatado corretamente, portanto, o Terraform não retornará nenhum nome de arquivo.
terraform validate #Valide sua configuração
terraform show #Inspect the current state
terraform state list
terraform output #lista todos os outputs do seu escopo atual
```

## Providers

- Um provedor é um plugin que o Terraform usa para criar e gerenciar seus recursos.

## Resources

- blocos para definir componentes de sua infraestrutura.
- Um recurso pode ser um componente físico ou virtual, como uma instância do EC2, ou pode ser um recurso lógico, como um aplicativo Heroku
- Os blocos de recursos têm duas strings antes do bloco: o *tipo de recurso* e o *nome do recurso*
    - Por exemplo, o ID da sua instância do EC2 é `aws_instance.app_server`
    - Registros DNS
