ORG=libhkl
REPO=tests
LOGFILE=build-log.txt
TAG=latest
LOG_DIR=.

FULLNAME=$(ORG)/$(REPO):$(TAG)

build ::
	echo "# started: " `date --iso-8601="seconds"` | tee $(LOGFILE)
	docker build \
		-t $(FULLNAME)  \
		./  \
		2>&1 | tee -a $(LOGFILE)
	echo "# finished: " `date --iso-8601="seconds"` | tee -a $(LOGFILE)

libhkl ::
	docker cp phoenix:/opt/libhkl.tar.gz ./libhkl.tar.gz

run ::
	docker run \
		-it \
		--rm \
		--name=$(REPO) \
		$(FULLNAME) \
		/bin/bash

shell :: build run

prune ::
	docker image prune -a -f
	docker system prune -f
