Given /^I am authenticated$/ do
  @current_user = create(:user)
  visit '/sign_in'
  within("form") do
    fill_in 'Email', :with => @current_user.email
    fill_in 'Password', :with => @current_user.password
  end
  click_button "Sign in"
end

Given /^I am not authenticated$/ do
  # nothing required
end

When /^I sign up with developer authentication with user name: "(.*?)" and email: "(.*?)"$/ do |user, email|
  visit '/users/auth/developer'
  within("form") do
    fill_in 'Name', :with => user
    fill_in 'Email', :with => email
  end
  click_button "Sign In"
end

When /^I confirm my details$/ do
  click_button "Sign up"
end

Then /^a new user should be created with screen name "(.*?)"$/ do |arg1|
  User.where(:screen_name => arg1).any?
end

Then /^I should be able to enter a "(.*?)"$/ do |field|
  within("form") do
    fill_in field, :with => 'value'
  end
end

When /^I enter user name: "(.*?)" and email: "(.*?)"$/ do |user, email|
  within("form") do
    fill_in 'user_screen_name', :with => user
    fill_in 'user_email', :with => email
  end
  click_button "Sign up"
end