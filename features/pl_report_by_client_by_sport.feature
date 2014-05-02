Feature: Report by sport

	As a user
	I want to view report
	So that I can see report by sport

	Background:
    	Given I am at the homepage
        When I click "P/L By Client By Sport"

    Scenario: with known sport_id
    	When there is a Bet, Client, and Sport
        And I fill in the following:
            | start_date | 2014-04-25 |
            | end_date   | 2014-04-28 |
        Then I should see Client with sport name
 
 