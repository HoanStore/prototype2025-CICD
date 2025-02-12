# 배포할 JAR 파일 이름
JAR_NAME="prototype2025-cicd-0.0.1-SNAPSHOT.jar"

# 기존 애플리케이션 종료
echo "$(date) - 기존 애플리케이션 종료..."

PID=$(ps aux | grep "$JAR_NAME" | grep -v grep | awk '{print $2}')
if [ ! -z "$PID" ]; then
    kill -9 $PID
    echo "$(date) - 기존 애플리케이션 종료 완료."
else
    echo "$(date) - 실행 중인 애플리케이션이 없습니다."
fi

# JAR 파일을 실행
echo "$(date) - 애플리케이션 실행 시작..."
nohup java -jar /var/jenkins_home/workspace/MY_NEW_CI_CD/prototype2025-CICD/target/$JAR_NAME > /var/jenkins_home/workspace/MY_NEW_CI_CD/prototype2025-CICD/target/application.log 2>&1 &
if [ $? -eq 0 ]; then
    echo "$(date) - 애플리케이션 실행 완료."
else
    echo "$(date) - 애플리케이션 실행 실패!"
    exit 1
fi

echo "$(date) - 배포 완료!"
