#!/usr/bin/env bash

source="https://raw.githubusercontent.com/domdavis/gomake/master/install.sh"

if [ -f "Makefile" ]; then
    echo "There's already a Makefile here. Aborting."
    exit 1
fi

command -v go >/dev/null 2>&1 || {
    echo >&2 "Would be kind of useful if you had go installed. Aborting."
    exit 1
}

go get -u github.com/golang/lint/golint || {
	echo >&2 "Failed to install golint. Aborting."
    exit 1
}

command -v curl && {
    (curl -s "${source}") > Makefile
    echo "Done"
    exit 0
}

command -v wget && {
    (wget -qO- "${source}") > Makefile
    exit 0
}

echo >&2 "Couldn't find curl or wget. Aborting."
exit 1
