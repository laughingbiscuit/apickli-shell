#!/bin/sh
set -e

# Add apickli-shell-bootstrap to path
export PATH=$PATH:$PWD/bin

# Bootstrap a new project
mkdir /tmp/my-project
cd /tmp/my-project
apickli-shell-bootstrap

# Run the tests
sh apickli.sh | sh
