pipeline {
  environment {
    ECR_REPO = '<account>.dkr.ecr.<region>.amazonaws.com/nsp_auth'
  }
  agent {
    kubernetes {
      yaml '''
apiVersion: v1
kind: Pod
spec:
  volumes:
  - name: ivy
    persistentVolumeClaim:
      claimName: ivy-cache
  - name: sbt-creds
    configMap:
      name: sbt-credentials
  containers:
  - name: sbt
    image: 185889327143.dkr.ecr.ap-southeast-1.amazonaws.com/sbt-0.13
    command:
    - cat
    tty: true
    volumeMounts:
    - name: ivy
      mountPath: /root/.ivy2
    - name: sbt-creds
      mountPath: /root/.sbt
  - name: kaniko
    image: gcr.io/kaniko-project/executor:v1.20.1
    command:
    - /busybox/cat
    tty: true
    volumeMounts:
    - name: ivy
      mountPath: /root/.ivy2
'''
    }
  }
  stages {
    stage('Clone and compile') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'bitbucket-creds', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_PASSWORD')]) {
          sh 'git clone https://$GIT_USER:$GIT_PASSWORD@bitbucket.org/ncinga/nsp_auth.git'
        }
        container('sbt') {
          sh 'cd nsp_auth/serviceA && sbt -mem 2048 clean compile update dist'
        }
      }
    }
    stage('Build image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'aws-ecr-creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
          container('kaniko') {
            sh '/kaniko/executor --dockerfile=nsp_auth/Dockerfile --context=nsp_auth --destination=$ECR_REPO:$BUILD_NUMBER'
          }
        }
      }
    }
  }
}
