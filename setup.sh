# 현재 스크립트에서 사용할 변수 입력
USER = "OS계정명"


# Docker/Jenkins 초기 설정

# 1. 패기지 목록 업데이트
sudo apt update

# 2. 패키지 버전 업그레이드
sudo apt upgrade

# 3. 빌드 패키지를 포함한 도구 설치
sudo apt install build-essential apt-transport-https ca-certificates curl software-properties-common

# 4. 리눅스 배포판에 따라 Docker 패키지를 설치해주는 스크립트 제공
sudo wget -qO- https://get.docker.com/ | sh

# 5. Docker 실행
sudo systemctl start docker

# 6. 부팅시 Docker 자동 실행 설정
sudo systemctl enable docker

# 7. Docker 그룹에 계정 추가
sudo usermod -aG docker ${USER}

# 8. Docker 재시작
sudo systemctl restart docker

# 9. Jenkins 이미지 설치
docker pull jenkins/jenkins:lts

# 10. Jenkins 다음 컨테이너 설정으로 이미지 실행
docker run -d -p 8080:8080 -p 50000:50000 -v /jenkins:/var/jenkins -v /home/${USER}/.ssh:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock --name jenkins -u root jenkins/jenkins:lts
