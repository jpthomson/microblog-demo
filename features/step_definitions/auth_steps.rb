Given /^I am authenticated$/ do
  user = create(:user)
  visit '/sign_in'
  within("form") do
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button "Sign in"
  end
end

Given /^I am not authenticated$/ do
  # nothing required
end
