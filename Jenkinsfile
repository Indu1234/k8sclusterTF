pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('ACCESS_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = 'us-east-1' // Change this to your desired region
    }

    stages {
        stage('Checkout external proj') {
        steps {
            git branch: 'my_specific_branch',
                credentialsId: 'gitscm',
                url: 'https://github.com/Indu1234/k8sclusterTF.git'
            sh "ls -lat"
            sh "pwd"
        }
    }}

        stage('Terraform Apply') {
            steps {
                script {
                    def terraformExecutable = 'terraform'

                    dir('path/to/terraform/code') {
                        sh "${terraformExecutable} init"

                        withAWS(credentials: [
                            awsAccessKeyIdVariable: 'AWS_ACCESS_KEY_ID',
                            awsSecretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
                            regionVariable: 'AWS_DEFAULT_REGION'
                        ]) {
                            sh "${terraformExecutable} plan"
                            // sh "${terraformExecutable} apply -auto-approve"
                        }
                    }
                }
            }
        }
    }
}
