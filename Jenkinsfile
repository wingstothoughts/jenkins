pipeline{
    agent any
    environment{
        PATH = "/opt/apache-maven-3.3.9/bin:$PATH"
        JAVA_HOME = "/usr/lib/jvm/jre-1.8.0-openjdk"
        
    }
    stages{
        stage("SCM"){
            steps{
                git branch: 'main', url: 'https://github.com/wingstothoughts/jenkins.git'
            }
        }
        stage("Maven Build"){
            steps{
                sh "mvn clean install"
            }
        }
        stage("Docker Build"){
            steps{
                sh "docker build -t wingstothoughts/medion:latest ."
            }
        }
        stage("Docker Push"){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockercred', variable: 'dockercred')]) {
                    sh "docker login -u wingstothoughts -p ${dockercred}"
}
                    sh "docker push wingstothoughts/medion:latest"
                }
            }
        }
    }
}
