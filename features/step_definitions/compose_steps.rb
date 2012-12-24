Given /^I am authenticated$/ do
  user = create(:user)
  visit '/sign_in'
  within("form") do
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button "Sign in"
  end
end

When /^I compose a bleat with content "(.*?)"$/ do |content|
  click_link 'Compose'
  within("#compose") do
    fill_in 'bleat[content]', :with => content
  end
  click_button 'post'
end

Then /^the first bleat on my profile page should contain "(.*?)"$/ do |content|
  page.all(".bleat").first.should have_content(content)
end
