pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kenkool23/demo-repository.git']]])
            }
        }
        
        stage('Scan with Sonar') {
            steps {
                withSonarQubeEnv('sonar') {
                sh "mvn -f SampleWebApp/pom.xml sonar:sonar"
            }
          }
        }
        
        stage('Build with Maven') {
            steps {
                sh 'cd SampleWebApp && mvn clean install'
            }
        }
        
        stage('Test') {
            steps {
                sh 'cd SampleWebApp && mvn test'
            }
        }
        
        stage('Deploy to Tomcat') {
            steps {
                deploy adapters: [tomcat9(credentialsId: '9a553b2d-20fe-4b54-b298-712626717cd9', 
                path: '', url: 'http://54.89.72.52:8080/')], 
                contextPath: 'webapp', war: '**/*.war'
            }
        }
    }
}

