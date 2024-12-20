Feature: The product store service back-end
    As a Product Store Owner
    I need a RESTful catalog service
    So that I can keep track of all my products

Background:
    Given the following products
        | name       | description     | price   | available | category   |
        | trebuchet |  A trebuchet to throw big rocks       | 999.99   | True | SIEGE_ENGINE |
        | siege tower | For the tallest walls. Assembly required.    | 999.99   |  False      | SIEGE_ENGINE |
        | ballista     | Goes through walls like a hot knife through butter! | 999.99 | True | SIEGE_ENGINE |
        | sword   | Finest Damascus steel   | 99.99 | True | SIDEARM |
        | mace | Simple yet effective | 9.99   | True      | SIDEARM |
        | plate armor | Our finest | 99.99 | True | BODY_PROTECTION  |
        | chain mail | For the fighter who likes to stay limber |59.99 | True | BODY_PROTECTION  |
        | pitch | Just boil and pour | 2.99 | True | FLAMMABLES  |
        | Greek fire | Only with written permission from the Basileus | 19.99 | True |  FLAMMABLES |
        | brimstone | Buy with our pitch |  5.99 | True | FLAMMABLES |
        | Imperial banner | Reprazent for your Basileus | 10.99 | True | SWAG |
        | riding boots | Like the ones the steppe archers use | 2.99 | False | SWAG |

Scenario: The server is running
    When I visit the "Home Page"
    Then I should see "Product Catalog Administration" in the title
    And I should not see "404 Not Found"

Scenario: Create a Product
    When I visit the "Home Page"
    And I set the "name" to "sword"
    And I set the "description" to "Finest Damascus steel"
    And I select "True" in the "available" dropdown
    And I select "Sidearm" in the "category" dropdown
    And I set the "price" to "99.99"
    And I press the "Create" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    Then the "Id" field should be empty
    And the "name" field should be empty
    And the "description" field should be empty
    When I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "sword" in the "name" field
    And I should see "Finest Damascus steel" in the "description" field
    And I should see "True" in the "available" dropdown
    And I should see "Sidearm" in the "category" dropdown
    And I should see "99.99" in the "price" field

Scenario: Read a Product
    When I visit the "Home Page"
    And I set the "name" to "sword"
    And I press the "Search" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "sword" in the "name" field
    And I should see "Finest Damascus steel" in the "description" field
    And I should see "True" in the "available" dropdown
    And I should see "Sidearm" in the "category" dropdown
    And I should see "99.99" in the "price" field 

Scenario: Update a Product
    When I visit the "Home Page"
    And I set the "Name" to "sword"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "99.99" in the "price" field
    When I change "price" to "129.99"
    And I press the "Update" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "129.99" in the "price" field
    And I should see "sword" in the "name" field


Scenario: Delete a Product
    When I visit the "Home Page"
    And I set the "name" to "sword"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Finest Damascus steel" in the "description" field
    When I copy the "Id" field
    And I press the "Clear" button
    And I paste the "Id" field
    And I press the "Delete" button
   Then I should see the message "Product has been Deleted!"
    When I press the "Clear" button
    And I press the "Search" button
    Then I should see the message "Success"
    And I should not see "sword" in the results


Scenario: List all products
    When I visit the "Home Page"
    And I press the "Clear" button
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "sword" in the results
    And I should see "Greek fire" in the results
    And I should see "trebuchet" in the results
    And I should see "ballista" in the results

Scenario: Search by category
    When I visit the "Home Page"
    And I press the "Clear" button
    And I select "Swag" in the "category" dropdown
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Imperial banner" in the results
    And I should see "riding boots" in the results
    And I should not see "Greek fire" in the results
    And I should not see "sword" in the results
    And I should not see "trebuchet" in the results

Scenario: Search by available
    When I visit the "Home Page"
    And I press the "Clear" button
    And I select "True" in the "available" dropdown
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Imperial banner" in the results
    And I should see "sword" in the results
    And I should see "Greek fire" in the results
    And I should see "trebuchet" in the results
    And I should see "ballista" in the results
    And I should see "sword" in the results
    And I should see "chain mail" in the results
    And I should see "plate armor" in the results
    And I should see "mace" in the results
    And I should see "pitch" in the results
    And I should see "brimstone" in the results
    And I should not see "riding boots" in the results
    And I should not see "siege tower" in the results

Scenario: Search by name
    When I visit the "Home Page"
    And I set the "name" to "mace"
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "mace" in the "name" field
    And I should see "Simple yet effective" in the "description" field