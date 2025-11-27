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
' ' 'json
aws-eks-iac-cicd-gitops-project/
│── terraform-aws-eks/              # Complete AWS Infrastructure (VPC, EKS, IAM)
│── terraform-jenkins-agent-setup/  # Jenkins agent setup using Terraform
│── cart-ci/                        # Jenkins CI pipeline for Cart microservice
│── catalogue-ci/
│── user-ci/
│── payment-ci/
│── shipping-ci/
│── frontend-ci/
│── user-cd/                        # ArgoCD Kubernetes manifests
│── cart-shipping-payment-frontend-ArgoCD/
│── jenkins-shared-library/         # Reusable CI functions
' ' '

## ⚙️ Infrastructure (IaC) – Terraform

### Provisioned Using Terraform:

VPC, Subnets, Route Tables

Internet & NAT Gateways

EKS Cluster + Node Groups

ECR Repositories

IAM Roles & Policies

Jenkins agent setup (EC2)

## Commands to deploy:
sh ' ' '
terraform init
terraform apply -auto-approve
' ' '