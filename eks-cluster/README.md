# Configuração do Ambiente

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
            "Resource": "arn:aws:iam::*:role/terraform-eks-demo-cluster"
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
            "Resource": "arn:aws:iam::*:role/terraform-eks-demo-node"
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

## Operação do Cluster Kubernetes
* Pra isso é necessário instalar o [aws-iam-authenticator](https://docs.aws.amazon.com/pt_br/eks/latest/userguide/install-aws-iam-authenticator.html).
* Em seguida executar: `chmod +x aws-iam-authenticator`
* `sudo mv aws-iam-authenticator /usr/local/bin`
* Checar a versão: `aws-iam-authenticator version`
