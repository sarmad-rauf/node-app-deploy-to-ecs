pipeline {
    agent any

    environment {
        GIT_CREDENTIALS_ID = 'github-pat'        // ID of your GitHub Personal Access Token in Jenkins
        AWS_CREDENTIALS_ID = 'aws-credentials'   // ID of your AWS credentials in Jenkins
        AWS_REGION = 'us-east-1'                 // Change to your AWS region
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the Terraform configuration code from GitHub
                git branch: 'master',
                    url: 'https://github.com/sarmad-rauf/node-app-deploy-to-ecs',
                    credentialsId: "${GIT_CREDENTIALS_ID}"
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                                  credentialsId: "${AWS_CREDENTIALS_ID}"]]) {
                    // Initialize Terraform
                    sh '''
                    cd Ecs
                    terraform init -backend-config="region=${AWS_REGION}"
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                                  credentialsId: "${AWS_CREDENTIALS_ID}"]]) {
                    // Show the Terraform plan on the console
                    sh '''
                    cd Ecs
                    terraform plan -out=tfplan
                    '''
                }
            }
        }

        stage('Manual Approval for Terraform Apply') {
            steps {
                script {
                    // Prompt for manual approval before applying Terraform changes
                    def userInput = input(
                        message: 'Do you want to apply the Terraform changes?',
                        ok: 'Apply',
                        parameters: [choice(name: 'Apply Terraform?', choices: 'Yes\nNo', description: 'Approve to apply changes?')]
                    )
                    if (userInput == 'Yes') {
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                                          credentialsId: "${AWS_CREDENTIALS_ID}"]]) {
                            // Apply Terraform changes
                            sh '''
                            cd terraform-directory
                            terraform apply -auto-approve tfplan
                            '''
                        }
                    } else {
                        error('Terraform apply was not approved by the user.')
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace
            cleanWs()
        }
        success {
            // Notify on success
            echo 'Pipeline succeeded!'
        }
        failure {
            // Notify on failure
            echo 'Pipeline failed!'
        }
    }
}
