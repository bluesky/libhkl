ORG=libhkl
REPO=phoenix
LOGFILE=build-log.txt
TAG=latest
LOG_DIR=.
NET=host-bridge

FULLNAME=$(ORG)/$(REPO):$(TAG)

build ::
	echo "# started: " `date --iso-8601="seconds"` | tee $(LOGFILE)
	docker build \
		-t $(FULLNAME)  \
		./  \
		2>&1 | tee -a $(LOGFILE)
	echo "# finished: " `date --iso-8601="seconds"` | tee -a $(LOGFILE)

run ::
	docker run \
		-it \
		--rm \
		--net=$(NET) \
		--name=$(REPO) \
		$(FULLNAME) \
		/bin/bash

shell :: build run

net ::
	docker network create \
		--driver bridge \
		$(NET)

### Remove all unused docker images (very brutal steps)
prune ::
	docker image prune -a -f
	docker system prune -f
