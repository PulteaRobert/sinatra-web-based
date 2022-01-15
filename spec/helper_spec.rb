# Configure coverage logging
require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end
SimpleCov.coverage_dir "coverage"

require "require_relative"

# Ensure we use the test database
ENV["APP_ENV"] = "testing"

# load the app
require_relative "../db/dbqueries"
require_relative "../models/mentor_pairing"

# Configure RSpec
require "rack/test"
require "rspec"

# Configure Capybara
require "capybara/rspec"

# add a test user
def add_test_user
  visit "/register"
  fill_in "username", with: "TestGuy"
  fill_in "password", with: "TestPassowrd"
  select 'Male', from: 'gender'
  select 'Computer Science', from: 'course'
  select 'Second Year', from: 'year_of_study'
  choose 'mentor'
  fill_in "email", with: "testemail@test.com"
  click_button "Submit"
end

# clear out the database
def clear_database
  DB.from("users").delete
end

#User.add("mentee1", "mentee1", "mentee", "email_mentee1", 2)
#User.add("mentee2", "mentee2", "mentee", "email_mentee1", nil)
#User.add("mentor1", "mentor1", "mentor", "email_mentor1", 1)
#User.add("mentor2", "mentor2", "mentor", "email_mentor2", 0)
