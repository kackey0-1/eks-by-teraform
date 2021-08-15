# EKS by Terraform

Before Using Terraform
```shell
aws configure
```

## install tfenv
```shell
# setup tfenv
$ git clone https://github.com/tfutils/tfenv.git ~/.tfenv
$ echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile
$ source ~/.bash_profile
###################################################################
# install 0.14.6 terraform version
$ tfenv install 0.14.6
# use 0.14.6 terraform version
$ tfenv use 0.14.6
```

```bash
# Download resources for AWS Provider
$ terraform init

# Describe how to build
$ terraform plan

# Create resources according to plan
$ terraform apply
# Delete resources
$ terraform destroy
```

## Setup EKS
- main
  - define common variables(name = locals)
- VPC
  - need to fix the range of subnet mask(now using /24), depend on the system scale
- EKS
  - use terraform-aws-modules/eks/aws
  - node_group eks's managed groups
  - if you want, you can use worker_groups field
- Kubernetes
  - make terraform able to access kubernetes cluster

```shell
# check user arn
$ aws sts get-caller-identity
# setup kubeconfig
$ aws eks update-kubeconfig --name eks-example --region ap-northeast-1 
$ aws eks update-kubeconfig --name eks-cluster-name --region aws-region --role-arn arn:aws:iam::XXXXXXXXXXXX:role/testrole
# create namespace
$ kubectl create ns sock-shop
# deploy application to k8s cluster
$ kubectl apply -f .
# get all pods
$ kubectl get pods -A -o wide

### Add user by admin user
$ aws sts get-caller-identity
$ kubectl edit configmap aws-auth -n kube-system
# add user to mapUsers directive
mapUsers: |
  - userarn: arn:aws:iam::XXXXXXXXXXXX:user/testuser
    username: testuser
    groups:
      - system:masters
```

## web app(Sock Shop)
```shell
$ kubectl create ns sock-shop
```