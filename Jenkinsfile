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
                build_app()
            }
        }    
        stage('Deploy') {
            steps {
                deploy_app()
            }
        }
    }
}

def execute(command) {
    if (isUnix()) {
        sh command
    }
    else {
        bat command
    }
}

def build_app() {
    echo 'Stopping app...'
    execute('docker-compose stop app')
    echo 'Deleting stopped app...'
    execute('docker-compose rm -f')
    echo 'Buldind...'
    execute('docker-compose build')
}

def deploy_app() {
    echo 'Deploying...'
    execute('docker-compose up -d')
}