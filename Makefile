up: check-pre-requisites
	docker-compose -f postgres/docker-compose.yml up -d

down: check-pre-requisites
	docker-compose -f postgres/docker-compose.yml down
	# remove following lines for data persistence between restarts
	rm -rf postgres/volumes

check-pre-requisites:
	@command -v docker || (echo "Docker not installed!" && exit 1)
	@command -v docker-compose || (echo "Docker compose not installed!" && exit 1)
