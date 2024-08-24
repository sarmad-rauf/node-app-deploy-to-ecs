pipeline {
    agent any

    environment {
        NODE_ENV = 'production'
        TF_VAR_example = 'value'  // Define your Terraform variables here
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://your-git-repo-url.git'
            }
        }

        stage('Install Node.js Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                cd terraform-directory
                terraform init
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                cd terraform-directory
                terraform plan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                cd terraform-directory
                terraform apply -auto-approve
                '''
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
