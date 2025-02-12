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


5. Docker 실행 가능한 Jenkins 컨테이너 설정

