# Terraform + Helm Project to create EKS and example Helm Chart which is stored in ECR

## Usage

1. Deploy Infrastructure:

```md
cd terraform
terraform init
terraform plan
terraform apply
```

2. Authenticate your Helm client to the Amazon ECR registry:

```md
aws ecr get-login-password \
     --region <YOUR REGION> | helm registry login \
     --username AWS \
     --password-stdin <YOUR ACCOUNT NR>.dkr.ecr.<YOUR REGION>.amazonaws.com
```

3. Push your helm chart to ECR:
```md
helm push helm-0.1.0.tgz oci://<YOUR ACCOUNT NR>.dkr.ecr.<YOUR REGION>.amazonaws.com/
```

4. Authenticate your kubectl Amazon EKS cluster:
```md
aws eks --region <YOUR REGION> update-kubeconfig --name example
```

5. Install Hem CHart from ECR:
```md
helm install ecr-chart-demo oci://<YOUR ACCOUNT NR>.dkr.ecr.<YOUR REGION>.amazonaws.com/helm --version 0.1.0
```

6. Check if Configmap from ECR Helm Chart is deployed in k8s:
```md
kubectl get cm
kubectl describe cm helm-configmap
```

![CM](https://raw.githubusercontent.com/HubGab-Git/eks_helm/main/screen.png)