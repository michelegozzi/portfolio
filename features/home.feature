Feature: Display the list of projects
  In order to know which audio books the collection contains
  As an audio book enthusiast
  I want to see a list of all audio books
 
  Scenario: Display the list of all projects in the collection
    Given some audio books in the collection
    When I visit the list of audio books
    Then I see all audio books