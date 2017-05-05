ifeq ($(GOBIN),)
GOBIN := $(GOPATH)/bin
endif

clean:
	go clean

dependencies:
	go get -u github.com/golang/lint/golint
	go get -u github.com/kardianos/govendor
	$(GOBIN)/govendor sync

build:
	go build

check:
	go vet `go list ./... | grep -v /vendor/`
	golint `go list ./... | grep -v /vendor/`

test: check
	go test `go list ./... | grep -v /vendor/`

ci: clean dependencies build test

default: build

.PHONY: test
