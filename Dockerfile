# 베이스 이미지를 node:lts-alpine으로 설정하여 이미지 크기 줄이기
FROM node:lts-alpine

# 작업 디렉토리를 /app으로 설정
WORKDIR /app

# package.json 및 package-lock.json 파일을 작업 디렉토리로 복사
COPY package*.json ./

# 의존성 설치
RUN npm install

# 나머지 애플리케이션 소스 코드를 작업 디렉토리로 복사
COPY . .

# 애플리케이션 빌드
RUN npm run build

# 컨테이너가 사용할 포트 노출
EXPOSE 3000

# 컨테이너 시작 명령어
CMD ["npm", "start"]
