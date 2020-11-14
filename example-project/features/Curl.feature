Feature: 
  As an Application Programmer
  I want to Interface with a Web Application
  So that I can use third party data

  Scenario: I POST to HTTPBin
    Given I run apk add curl
    And I set variable URL to https://httpbin.org/post
    And I run echo "doing an arbitary command"
    And I write file request.json to $PWD
    When I successfully run curl -sf $URL -H "Content-Type: application/json" -d @request.json
    Then I can now successfully run echo $?
    And result contains branza
    And result does not contain cheese
    And on the result, I run sed 's/branza/cheese/g'
    And result JSON .json.name should be branza
    And result JSON .json.name should not be cheese
    And on the result, I run jq -e '.args'
    And I can now successfully run myCustomFunction
    And I can now successfully run myCustomAlias

  Scenario: I fail to run HTTPBin
    Given I have a custom step
    When I fail to run curl -sf https://httpbin.org/status/500
    Then result does not contain success
    
