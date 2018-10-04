Given(/^the following movies exist:$/) do |table|
  table.hashes.each do |movie|
		Movie.create(movie)
	end
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |title, director|
  Movie.find_by_title(title).director.should eq director 
end


When(/^I set "([^"]*)" to "([^"]*)"$/) do |rating_list, rating|
  select(rating, from: rating_list)
end

Then(/^the rating of "([^"]*)" should be "([^"]*)"$/) do |title, rating|
  Movie.find_by_title(title).rating.should eq rating
end