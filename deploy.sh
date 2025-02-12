#!/bin/bash

# 배포할 JAR 파일 이름
JAR_NAME="prototype2025-cicd-0.0.1-SNAPSHOT.jar"

# 로그 파일 위치
LOG_FILE="/var/jenkins_home/workspace/MY_NEW_CI_CD/prototype2025-CICD/log/deploy.log"

# 배포 스크립트 권한 부여 (권한 없으면 실행할 수 없으므로)
chmod +x ./deploy.sh  # 스크립트에 실행 권한을 부여

echo "$(date) - 배포 시작..." >> $LOG_FILE

# 서버가 이미 실행 중이면 이전 프로세스 종료
echo "$(date) - 기존 애플리케이션 종료..." >> $LOG_FILE
PID=$(ps aux | grep "$JAR_NAME" | grep -v grep | awk '{print $2}')
if [ ! -z "$PID" ]; then
    kill -9 $PID
    echo "$(date) - 기존 애플리케이션 종료 완료." >> $LOG_FILE
else
    echo "$(date) - 실행 중인 애플리케이션이 없습니다." >> $LOG_FILE
fi

# JAR 파일을 실행
echo "$(date) - 애플리케이션 실행 시작..." >> $LOG_FILE
nohup java -jar /var/jenkins_home/workspace/MY_NEW_CI_CD/prototype2025-CICD/target/$JAR_NAME > /var/jenkins_home/workspace/MY_NEW_CI_CD/prototype2025-CICD/target/application.log 2>&1 &
if [ $? -eq 0 ]; then
    echo "$(date) - 애플리케이션 실행 완료." >> $LOG_FILE
else
    echo "$(date) - 애플리케이션 실행 실패!" >> $LOG_FILE
    exit 1
fi

echo "$(date) - 배포 완료!" >> $LOG_FILE
