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
(
echo Feature:
echo As an Application Programmer
echo I want to Interface with a Web Application
echo So that I can use third party data
)
(
echo Scenario: I POST to HTTPBin
echo Given I run apk add curl
apk add curl > /dev/null
echo And I set variable URL to https://httpbin.org/post
URL=https://httpbin.org/post
echo And I run echo "doing an arbitary command"
echo "doing an arbitary command" > /dev/null
echo And I write file request.json to $PWD
cp $SCRIPTPATH/features/fixtures/request.json $PWD
echo When I successfully run curl -sf $URL -H "Content-Type: application/json" -d @request.json
RESULT=$(curl -sf $URL -H "Content-Type: application/json" -d @request.json)
echo Then I can now successfully run echo $?
echo $? > /dev/null
echo And result contains branza
echo $RESULT | grep -q branza
echo And result does not contain cheese
echo $RESULT | grep -q -v cheese
echo And on the result, I run sed 's/branza/cheese/g'
echo $RESULT | sed 's/branza/cheese/g' > /dev/null
echo And result JSON .json.name should be branza
echo $RESULT | test $(jq -r -e '.json.name') == branza
echo And result JSON .json.name should not be cheese
echo $RESULT | test $(jq -r -e '.json.name') != cheese
echo And on the result, I run jq -e '.args'
echo $RESULT | jq -e '.args' > /dev/null
echo And I can now successfully run myCustomFunction
myCustomFunction > /dev/null
echo And I can now successfully run myCustomAlias
myCustomAlias > /dev/null
)
(
echo Scenario: I fail to run HTTPBin
echo Given I have a custom step
test "abc" == "abc"
echo When I fail to run curl -sf https://httpbin.org/status/500
! RESULT=$(curl -sf https://httpbin.org/status/500)
echo Then result does not contain success
echo $RESULT | grep -q -v success
