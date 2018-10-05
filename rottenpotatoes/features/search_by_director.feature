Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: add director to existing movie
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Ridley Scott"

Scenario: find movie with same director
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"

  
Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Alien"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Alien' has no director info"
  
#added_scenario 1 
Scenario: update rating
  Given I am on the details page for "Alien"
  When  I follow "Edit"
  And  I set "Rating" to "NC-17"
  And  I press "Update Movie Info"
  Then the rating of "Alien" should be "NC-17"
#added_scenario 2  
Scenario: rating filters
  Given I am on the home page
  And I uncheck "ratings[PG]"
  And I press "Refresh"
  Then  I should not see "Star Wars"
  And I should see "Alien"
#added_scenario 3  
Scenario: back to home page when in similar page
  Given  I am on the Similar Movies page for "Star Wars"
  And  I follow "Movie Title"
  Then I should be on the home page
#added_scenario 4 
Scenario: Uncheck all filters
  Given  I am on the home page
  And I uncheck "ratings[PG]"
  And I uncheck "ratings[G]"
  And I uncheck "ratings[PG-13]"
  And I uncheck "ratings[NC-17]"
  And I uncheck "ratings[R]"
  Then I should be on the home page 
  And I should see "Alien"
  And I should see "Star Wars"
  And I should see "Blade Runner"
  And I should see "THX-1138"
  And I should see "ratings[PG]" checked