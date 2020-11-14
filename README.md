# Apickli Shell

![pipeline](https://github.com/laughingbiscuit/apickli-shell/workflows/Apickli%20Shell%20Pipeline/badge.svg)


## Summary

An apickli-style implementation of Cucumber for POSIX shell, with some useful 
predefined step definitions. Aside from the JQ commands, everything can be run
in any POSIX shell. No more Ruby/Node/Java!

## Goals

- Convert minimal Gherkin feature files to a shell script ✓
- Convert all Gherkin into `echo` statements followed by their implementation ✓
- Allow variables to be scoped to a Scenario ✓
- Allow custom shell functions and aliases to be included ✓
- Allow custom sed commands to define step definitions ✓
- Allow a `DEBUG` flag to `set -x` and view intermediate test script before run ✓

## Quick Start

Just run `sh cucumber-sh` to stdout the converted Feature files as a test script. You can redirect this to a file `sh cucumber-sh > test.sh` and run it `sh test.sh`. Add the env variable `DEBUG=1` for verbose output.

## Example

See the [Feature](https://github.com/laughingbiscuit/apickli-shell/blob/main/example-project/features/Curl.feature) file, example generated [test script](https://github.com/laughingbiscuit/apickli-shell/blob/main/sample-test-output.sh) and CI [output](https://github.com/laughingbiscuit/apickli-shell/runs/1400907688?check_suite_focus=true) for a working example.

## Supported Steps

```
Given I run command <command>
Given I set variable <name> to <value>
Given I write file <fixture> to <path>
When I successfully run <command>
When I fail to run <command>
Then result contains <string>
Then result does not contain <string>
Then on result, I run <command>
Then I can now successfully run <command>
Then result JSON <jq path> should be <value> 		# requires jq
Then result JSON <jq path> should not be <value> 	# requires jq
```

## Docker

In the example, `docker` to ensure that the tests are repeatable on any machine.
This can be considered a _Best Practice_ and is optional. Really, all we do is
generate a shell script.

## Future Improvements

- Reporting by running script without `DEBUG=1`. Then we can `diff` the feature
file and the test output. Missing lines are failed or skipped and can be colour 
coded in a HTML report.

## Disclaimer

This is a personal project and not a supported Google product.
