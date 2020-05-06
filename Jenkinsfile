pipeline {
    agent any 
    stages {
        stage('Checkout') {
            steps {
                echo 'Downloading...'
                git 'https://github.com/sergeykucher/footgo-jenkins.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Buldind...'
                execute('docker-compose build')
            }
        }    
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                execute('docker-compose up -d')
            }
        }
    }
}

def execute(command) {
    env.UNIX = isUnix()
    if (Boolean.valueOf(env.UNIX)) {
        sh command
    }
    else {
        bat command
    }
}