clean:
	go clean

dependencies:
	go get -u github.com/kardianos/govendor
	$(GOBIN)/govendor sync

build:
	go build

check:
	go vet ./...
	golint ./...

test: check
	go test ./...

ci: clean dependencies build test

default: build

.PHONY: test
