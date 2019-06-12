UID_GID?=$(shell id -u):$(shell id -g)

all: binary

binary:
	docker run -it --rm -v $(shell pwd):/build -w /build golang:1.12 sh -c "\
		make footloose && \
		chown ${UID_GID} bin/footloose"

install: binary
	sudo cp bin/footloose /usr/local/bin/

footloose: bin/footloose
bin/footloose:
	CGO_ENABLED=0 go build -mod=vendor -o bin/footloose .

.PHONY: bin/footloose