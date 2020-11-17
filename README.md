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

Install the tool
```
git clone https://github.com/laughingbiscuit/apickli-shell
export PATH=$PATH:$PWD/apickli-shell/bin
# optionally add this to your .bashrc/.zshrc/.profile now
```

Bootstrap your test project

```
mkdir $HOME/my-test-project
cd $HOME/my-test-project
apickli-shell-bootstrap
```

Run the tests
```
sh apickli.sh | sh
```

Debug the tests
```
DEBUG=1 sh apickli.sh | sh
```

View the generated script
```
sh apickli.sh > generated-script.sh
```

## Supported Steps

```
Given I run command <command>
Given I set variable <name> to <value>
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

Docker can be used to ensure that the tests are repeatable on any machine from a clean environment.
This can be considered a _Best Practice_ (particularly if you have complex dependencies or are writing to the filesystem) but is optional. Really, all this tool does is generate a shell script.

## Future Improvements

- Reporting by running script without `DEBUG=1`. Then we can `diff` the feature
file and the test output. Missing lines are failed or skipped and can be colour 
coded in a HTML report.

## Disclaimer

This is a personal project and not a supported Google product.
