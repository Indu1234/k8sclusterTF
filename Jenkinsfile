pipeline {
    agent any

    stages {
        stage('Checkout external proj') {
            steps {
                checkout scmGit(
                branches: [[name: 'master']],
                userRemoteConfigs: [[url: 'https://github.com/Indu1234/k8sclusterTF.git']])
                script {
                    sh "ls -lat"
                    sh "pwd"
                }
            }
        }
        stage('Terraform plan') {
            steps {
                script {
                    sh "terraform init"
                    sleep(5)
                    sh "terraform plan -lock=false"
                    sleep(5)
                }
                    
            }
        }
        stage('Terraform apply') {
            steps {
                script {
                    sh "terraform apply -lock=false -auto-approve"
                    sleep(5)
                }
            }
        }
    }
    post {
        // Clean after build
        always {
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,)
        }
    }
}
