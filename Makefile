CGO_ENABLED=0
GOOS=linux
GOARCH=amd64
TAG=${1:-latest}

all: build

build:
	@go build -a -tags 'netgo' -ldflags '-w -linkmode external -extldflags -static' .

image: build
	@docker build -t ehazlett/conduit:$(TAG) .

.PHONY: build
