pipeline {
        agent{
            node{
                label 'AGENT-1'
            }
        }
        options {
            timeout(time: 1, unit: 'HOURS')
            disableConcurrentBuilds()
            ansiColor('xterm')
        }
        parameters {

        string(name: 'version', defaultValue: '', description: 'What is the artifact version?')
        string(name: 'environment', defaultValue: '', description: 'What is the environment?')

    }
    stages{
        stage('Print version') {
            steps {
               sh """
                    echo "version: ${params.version}"
                    echo "environemnt: ${params.environment}"
               """
            }
        }
         stage('Init') {
            steps {
                sh """
                    cd terraform
                    terraform init --backend-config=${params.environment}/backend.tf -reconfigure
                """
            }
         }
          stage('Plan') {
            steps {
                sh """
                    cd terraform
                    terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}"
                """
            }
          }
          stage('Apply') {
            steps {
                sh """
                    cd terraform
                    terraform apply -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -auto-approve
                """
            }
          }
        
    }
    post { 
        always {
            echo 'I will alwasy say hello!'
            deleteDir()
        }
        failure {
            echo 'this is run when pipelines failed, used generallt to send some alerts'
        }
        success {
            echo 'I will say hello pipeline is success'
        }
    }
}

    

