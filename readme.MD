## 🚀 AWS EKS | Terraform | Jenkins CI/CD | ArgoCD GitOps — End-to-End DevOps Project

### This repository contains a fully automated production-ready DevOps setup built using:

* Infrastructure as Code (Terraform)

* Containerization (Docker)

* Kubernetes on AWS EKS

* CI/CD pipelines using Jenkins

* GitOps deployment using ArgoCD

* Microservices deployment (Cart, Catalogue, User, Payment, Shipping, Frontend)

* It simulates a real e-commerce platform (Roboshop) and demonstrates how modern teams deploy & manage cloud applications end-to-end.
![Architecture](image.png) ![Architecture](image-1.png)


## This project implements:

AWS EKS Cluster

VPC, Subnets, NAT Gateway, Security Groups

ECR for container images

Terraform for entire infra provisioning

Jenkins pipelines for CI & ECR push

ArgoCD for GitOps-based deployment to EKS

Microservices deployed as Kubernetes manifests

## 🏗️ Project Structure
```md
aws-eks-iac-cicd-gitops-project/
│── terraform-aws-eks/                       # Complete AWS Infrastructure (VPC, EKS, IAM)
│── terraform-jenkins-agent-setup/           # Jenkins agent setup using Terraform
│── cart-ci/                                 # Jenkins CI pipeline for Cart microservice
│── catalogue-ci/
│── user-ci/
│── payment-ci/
│── shipping-ci/
│── frontend-ci/
│── user-cd/                                  # ArgoCD Kubernetes manifests
│── cart-shipping-payment-frontend-ArgoCD/
│── jenkins-shared-library/                  # Reusable CI functions
```


## ⚙️ Infrastructure (IaC) – Terraform

### Provisioned Using Terraform:

VPC, Subnets, Route Tables

Internet & NAT Gateways

EKS Cluster + Node Groups

ECR Repositories

IAM Roles & Policies

Jenkins agent setup (EC2)

## Commands to deploy:
```md
terraform init
terraform apply -auto-approve
```

 ## 🛠️ CI/CD With Jenkins

### Each microservice has its own Jenkins pipeline:

✔ Builds Docker image
✔ Tags image with version
✔ Pushes to AWS ECR
✔ Updates ArgoCD manifests repo (GitOps flow)

Shared Library

Reusable Groovy functions stored in:
```
jenkins-shared-library/vars/
```
🚀 GitOps With ArgoCD (CD Layer)

ArgoCD pulls Kubernetes manifests from this repo and deploys to EKS automatically.

## Flow:

1️⃣ Developer pushes code
2️⃣ Jenkins builds & pushes image
3️⃣ Jenkins updates manifest image: <new-tag>
4️⃣ ArgoCD detects Git change
5️⃣ ArgoCD syncs & deploys new version to EKS

Zero manual deployment. Pure GitOps.