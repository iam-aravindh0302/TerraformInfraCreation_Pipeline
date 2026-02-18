Project Overview
Project Name: Infrastructure Pipeline Creation
Type: Infrastructure as Code (IaaC) CI/CD Pipeline
Cloud Provider: Amazon Web Services
CI/CD Tool: Jenkins
Source Control: GitHub
IaaC Tool: Terraform
________________________________________
Objective:
To design and implement a branch-based automated infrastructure deployment pipeline where:
•	Each Git branch represents an environment
•	GitHub push triggers Jenkins via webhook
•	Jenkins runs Terraform stages
•	Infrastructure is provisioned automatically in AWS
Branch Strategy:
The repository contains three main branches:
Branch	Environment	Purpose
dev	Development	Testing new infra changes
qa	Quality Assurance	Validation & testing
production	Production	Live production infrastructure
Each branch deploys infrastructure specific to that environment.

Architecture Flow:
Developer Push
      ↓
GitHub (branch: dev/qa/production)
      ↓ (Webhook Trigger)
Jenkins (Multibranch Pipeline)
      ↓
Terraform (Init → Plan → Apply)
      ↓
AWS Infrastructure Created
________________________________________
Infrastructure Per Environment:
🔹 DEV
•	1 VPC
•	2 EC2 instances (t2.small)
•	1 Subnet
•	1 S3 Bucket
🔹 QA
•	1 VPC
•	3 EC2 instances (t2.small)
•	1 Subnet
•	2 S3 Buckets
🔹 PRODUCTION
•	1 VPC
•	5 EC2 instances (t2.small)
•	Security Group
•	3 S3 Buckets
________________________________________Repository Structure:
TerrainInfraCreation_Pipeline/
│
├── Jenkinsfile
├── modules/
│   ├── vpc/
│   ├── ec2/
│   └── s3/
│
└── environments/
    ├── dev/
    ├── qa/
    └── production/
________________________________________
Jenkins Pipeline Stages:
The pipeline contains the following stages:
1️⃣ Checkout
Fetches code from GitHub branch.
2️⃣ Terraform Init
Initializes Terraform backend and plugins.
3️⃣ Terraform Plan
Generates execution plan.
4️⃣ Terraform Apply
Applies infrastructure changes to AWS.
________________________________________
Webhook Configuration:
•	GitHub Webhook URL:
http://<jenkins-ip>:8080/github-webhook/
•	Trigger: Push events
•	Response: 200 OK
Webhook ensures automatic triggering of pipeline upon code push.
________________________________________
 Key Features:
✔ Branch-based environment isolation
✔ Automated infrastructure provisioning
✔ Modular Terraform design
✔ CI/CD integration
✔ Scalable architecture
✔ Production-ready workflow
________________________________________Production Enhancement:
For production deployments, an approval stage can be added:
stage('Approval') {
  when {
    expression { env.BRANCH_NAME == 'production' }
  }
  steps {
    input message: "Approve Production Deployment?", ok: "Deploy"
  }
}
________________________________________Benefits of This Architecture:
•	Reduces manual infrastructure errors
•	Ensures consistent environment creation
•	Enables controlled production releases
•	Supports DevOps best practices
•	Scalable and maintainable

