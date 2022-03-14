# Configuração do Ambiente
Neste exemplo não estamos usando o terraform EKS module, apenas o [resource provido pela AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster)  
Instalar o [aws cli](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-welcome.html) e configurar de acordo com sua conta na AWS

## Setup Usuário
```bash
export AWS_ACCESS_KEY_ID="<key>"
export AWS_SECRET_ACCESS_KEY="<acess_key>"
export AWS_DEFAULT_REGION="<aws_region>"
```

## Políticas Usuário AWS IAM
Será necessário para execução a criação de um usuário IAM na AWS pertencente a um grupo com as políticas sobre o EKS, EC2 e uma política 
particular IAMTerraformEKSClusterManagerPolicy sendo ela:

```bash
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "iam:AttachRolePolicy",
                "iam:CreateRole",
                "iam:PutRolePolicy",
                "iam:DetachRolePolicy",
                "iam:DeleteRole",
                "iam:PassRole"
            ],
            "Resource": "arn:aws:iam::*:role/terraform-eks-cluster"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:AttachRolePolicy",
                "iam:CreateRole",
                "iam:PutRolePolicy",
                "iam:DetachRolePolicy",
                "iam:DeleteRole",
                "iam:PassRole"
            ],
            "Resource": "arn:aws:iam::*:role/terraform-eks-node-group"
        }
    ]
}
```

## Tempo Gasto pelo Terraform para Provisionamento
15 min. Para destruição são 19min

## Itens Provisionados
```data.aws_availability_zones.available
data.http.workstation-external-ip
aws_eks_cluster.demo
aws_eks_node_group.demo
aws_iam_role.demo-cluster
aws_iam_role.demo-node
aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy
aws_iam_role_policy_attachment.demo-cluster-AmazonEKSVPCResourceController
aws_iam_role_policy_attachment.demo-node-AmazonEC2ContainerRegistryReadOnly
aws_iam_role_policy_attachment.demo-node-AmazonEKSWorkerNodePolicy
aws_iam_role_policy_attachment.demo-node-AmazonEKS_CNI_Policy
aws_internet_gateway.demo
aws_route_table.demo
aws_route_table_association.demo[0]
aws_route_table_association.demo[1]
aws_security_group.demo-cluster
aws_security_group_rule.demo-cluster-ingress-workstation-https
aws_subnet.demo[0]
aws_subnet.demo[1]
aws_vpc.demo
```

## Recursos Provisionados por Default na AWS
Região AWS: sa-east-1  
ID AMI: ami-01f2084a82b314981  
Nome da AMI: amazon-eks-node-1.21-v20220303  
Instância EC2: t3.medium 2 vCPU 4GB RAM   
Volume: 20 GB tipo: gp2 - Não criptografado

## Etapas para Provionamento do Cluster Kubernetes
1. Seguir as etapas de configuração da autenticação do Terraform na AWS disponível [aqui](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
2. Em seguida é necessário instalar o [aws-iam-authenticator](https://docs.aws.amazon.com/pt_br/eks/latest/userguide/install-aws-iam-authenticator.html).
3. Em seguida executar: `chmod +x aws-iam-authenticator`
4. `sudo mv aws-iam-authenticator /usr/local/bin`
5. Checar a versão: `aws-iam-authenticator version`
6. Garante que o ambiente foi provisionado utilizando o `terraform apply`
7. Instalar o [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) em sua máquina
8. Execute: `rm ~/.kube/config` para remover a configuração prévia de outro cluster
9. Execute: `terraform output kubeconfig > ~/.kube/config`
10. Em seguida abra o arquivo criado e remova os trechos `<<EOT` e `EOT` e salve
11. Em seguida o comando `kubectl cluster-info` deve executar com sucesso
12. Por fim execute `kubectl apply -f /media/WORK/devops/terraform-pratice/eks-cluster/kubernetes/app.yaml`
13. Após uns 5 minutos execute `kubectl get svc`
14. Deverá ser possível acessar o EXTERNAL-IP do external-nginx-service pela internet e assim cairá na tela inicial do NGINX
15. Fim!! Seu cluster está em execução na AWS e sua aplicação acessível pela internet :D
