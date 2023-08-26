pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('ACCESS_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = 'us-east-1' // Change this to your desired region
    }

    stages {
        stage('Checkout Terraform project') {
        steps {
            checkout scmGit(
            branches: [[name: 'master']],
            userRemoteConfigs: [[url: 'https://github.com/Indu1234/k8sclusterTF.git']])
            sh "ls -lat"
            sh "pwd"
        }
    }}

        stage('Terraform run') {
            steps {
                script {
                    sh "terraform init"

                    withAWS(credentials: [
                        awsAccessKeyIdVariable: 'AWS_ACCESS_KEY_ID',
                        awsSecretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
                        regionVariable: 'AWS_DEFAULT_REGION'
                    ]) {
                        sh "terraform init"
                        sh "terraform plan"
                        sh "terraform apply -auto-approve"
                    }
                    
                }
            }
        }
    }
