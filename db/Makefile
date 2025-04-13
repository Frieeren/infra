.PHONY: build start stop logs clean

# 컨테이너 이름
CONTAINER_NAME = mysql-container
DOCKER_IMAGE_NAME = mysql-custom

# DB 접속 정보
MYSQL_ROOT_PASSWORD = root_password
MYSQL_USER = user
MYSQL_PASSWORD = password
MYSQL_DATABASE = my_database

# 이미지 빌드
build:
	docker build -t $(DOCKER_IMAGE_NAME) .

# 컨테이너 시작
start:
	@if [ -d "data" ]; then \
		echo "Removing existing data directory..."; \
		rm -rf data; \
	fi
	mkdir -p data
	docker run -d \
		--name $(CONTAINER_NAME) \
		-p 3306:3306 \
		-v $(PWD)/data:/var/lib/mysql \
		-e MYSQL_ROOT_PASSWORD=$(MYSQL_ROOT_PASSWORD) \
		-e MYSQL_USER=$(MYSQL_USER) \
		-e MYSQL_PASSWORD=$(MYSQL_PASSWORD) \
		-e MYSQL_DATABASE=$(MYSQL_DATABASE) \
		$(DOCKER_IMAGE_NAME)

# 컨테이너 중지
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# 로그 확인
logs:
	docker logs -f $(CONTAINER_NAME)

# 컨테이너와 이미지 정리
clean: stop
	docker rmi $(DOCKER_IMAGE_NAME) || true
	rm -rf data/*

# MySQL 클라이언트로 연결
connect:
	docker exec -it $(CONTAINER_NAME) mysql -u$(MYSQL_USER) -p$(MYSQL_PASSWORD) $(MYSQL_DATABASE)
