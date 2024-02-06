pipeline {
        agent{
            node{
                label 'AGENT-1'
            }
        }
        // environment { 
        //     GREETING = 'Hello Jenkins'
        //     packageVersion = ''
        //     nexusURL = '172.31.10.3:8081'
        // }
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
    

