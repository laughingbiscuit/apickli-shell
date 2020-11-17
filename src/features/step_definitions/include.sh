#!/bin/sh
# This file is included at the top of the test script. 
# You can extend it

# Fail on error
set -e

# If the $DEBUG flag is set, our custom code should be verbose
[ ! -z "$DEBUG" ] && set -x
echo "Debug state is: [$DEBUG]"

trap '[ $? -ne 0 ] && echo "FAIL" || echo "PASS"' EXIT
