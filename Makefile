up: check-pre-requisites postgres-up exchange-up broker-up
	@echo "$@ finished!"

postgres-up:
	docker-compose -f postgres/docker-compose.yml up -d
	# sleep so that postgres server is up
	# In future need to solve using healthcheck of docker
	sleep 10

exchange-up:
	docker build -f exchange/Dockerfile -t dinakar/exchange ./exchange
	docker-compose -f exchange/docker-compose.yml up -d

broker-up:
	docker build -f broker/Dockerfile -t dinakar/broker ./broker
	docker-compose -f broker/docker-compose.yml up -d

down: check-pre-requisites broker-down exchange-down postgres-down
	@echo "$@ finished"

postgres-down:
	docker-compose -f postgres/docker-compose.yml down
	rm -rf postgres/volumes

exchange-down:
	docker-compose -f exchange/docker-compose.yml down
	rm -rf exchange/volumes

broker-down:
	docker-compose -f broker/docker-compose.yml down
	rm -rf broker/volumes

check-pre-requisites:
	@command -v docker || (echo "Docker not installed!" && exit 1)
	@command -v docker-compose || (echo "Docker compose not installed!" && exit 1)
