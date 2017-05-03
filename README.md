# Go Make

A basic Golang `Makefile`.

## Installation

From the root directory of your Go project:

```bash
bash <(wget -qO- http://github.com/domdavis/blob/master/install.sh)
```

or

```bash
bash <(curl -s http://github.com/domdavis/blob/master/install.sh)
```

or for the less trusting:

```bash
go get -u github.com/golang/lint/golint
(curl -s http://github.com/domdavis/blob/master/Makefile) > Makefile
```

Which is basically all the script does anyway.

## Usage

`make clean` and `make build` map directly to `go clean` and `go build`
respectively with the default target being `build`.

`make dependencies` will sync vendor dependencies.

`make check` runs `go vet` and `golint` recursively down the entire package

`make test` runs the `check` target, then runs `go test` recursively down the
entire package.

`make ci` cleans, builds, checks and tests the package and is intended for use
with your CI/CD pipeline.

## TODO

  * Choice of vendoring options
  * Add `docker` target
  * Add `goimports` target

## License

Go Make is released into the Public Domain. Do with it what you will.
