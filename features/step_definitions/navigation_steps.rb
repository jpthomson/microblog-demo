When /^I visit the home page$/ do
  visit root_url
end

When /^I visit my profile$/ do
  visit user_path(@current_user)
end
