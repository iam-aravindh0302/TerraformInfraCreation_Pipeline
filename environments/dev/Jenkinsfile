pipeline {
  agent any

  environment {
    ENV = "${envs.BRANCH_NAME}"
    TF_WORKDIR = "environments/${envs.BRANCH_NAME}"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: "${envs.BRANCH_NAME}", url: 'https://github.com/iam-aravindh0302/TerraformInfraCreation_Pipeline.git'
      }
    }

    stage('Terraform Init') {
      steps {
        dir("${TF_WORKDIR}") {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        dir("${TF_WORKDIR}") {
          sh 'terraform plan -out=tfplan'
          sh 'terraform show -no-color tfplan > tfplan.txt'
          sh 'cat tfplan.txt'
        }
      }
    }

    stage('Approval') {
      
      when {
        expression { envs.BRANCH_NAME == 'production' }
      }
    
      steps {
        input message: "Approvee the deployment to production?", ok: 'Deploy'
      }
    }

    stage('Terraform Apply') {
      steps {
        dir("${TF_WORKDIR}") {
          sh 'terraform apply tfplan'
        }
      }
    }
  }
}