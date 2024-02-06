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
        }
        parameters {

        string(name: 'version', defaultValue: '1.0.0', description: 'What is the artifact version?')
        string(name: 'environment', defaultValue: 'dev', description: 'What is the environment?')

    }
    stages{
        stage('Deploy') {
            steps {
               sh """
                    echo "version: ${params.version}"
                    echo "environemnt: ${params.environment}"
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
    

