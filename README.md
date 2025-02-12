# prototype2025-CICD


1. Docker로 Jenkins 컨테이너 실행
```
docker run -d --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts
```

2. Jenkins 초기 비밀번호 확인
```
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

3. 플러그인 설치
```

```

4. 계정 설정
```
admin / admin
```


5. 젠킨스 스크립트 

```
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                script {
                    // 클론 전에 작업 공간을 청소합니다.
                    deleteDir()  // 이 명령어는 작업 공간의 모든 파일을 삭제합니다.
                    // 또는, 특정 디렉토리만 삭제하고 싶다면:
                    // sh 'rm -rf prototype2025-CICD'
                }
                withCredentials([usernamePassword(credentialsId: 'github-token', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_PASS')]) {
                    sh 'git clone https://${GIT_USER}:${GIT_PASS}@github.com/HoanStore/prototype2025-CICD.git'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'cd prototype2025-CICD && mvn clean package' // 필요에 따라 조정
            }
        }
        stage('Deploy') {
    steps {
        steps {
                sh '../deploy.sh' // 배포 스크립트 실행
            }
    }
}

    }
}
```

