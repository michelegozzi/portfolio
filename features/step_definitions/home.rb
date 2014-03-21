#encoding: utf-8
 
Given /^some audio books in the collection$/ do
  #upload_fixtures backend_url('audiobooks'), $fixtures
end
 
When /^I visit the list of audio books$/ do
  visit ui_url '/index.html'
end
 
Then /^I see all audio books$/ do
  page.should have_content 'Coraline'
  page.should have_content 'Man In The Dark'
  page.should have_content 'Siddhartha'
end