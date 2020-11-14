#!/bin/sh

###
# Contents of this file in included at the top of the test script
###

# Fail on error
set -e

# Allow script to be run from anywhere by using these paths
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# If the $DEBUG flag is set, our custom code should be verbose
[ ! -z "$DEBUG" ] && echo "set -x"
echo "Debug state is: [$DEBUG]"


# Some custom functions and aliases that can be used by our steps
function myCustomFunction 
{
  echo "my function"
}
alias myCustomAlias='echo "my alias"'
