#!/bin/sh

login=${1?Please specify login name}
token=${2:-${GITHUB_TOKEN}}

if [ -z "${token}" ]; then
    echo "Please provide a token or set GITHUB_TOKEN as environment variable";
    exit 1;
fi

echo "machine github.com login ${login} password ${token}" > ~/.netrc