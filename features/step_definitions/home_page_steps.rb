Given /^a new bleat with the content \#winning$/ do
  @user = User.create({:email => 'example@foo.com', :screen_name => 'example', :password => 'asdasd'}, without_protection: true)
  @bleat = Bleat.create({:content => "#winning", :user => @user}, without_protection: true)
end

When /^I visit the home page$/ do
  visit root_url
end

Then /^the first bleat on the home page should contain \#winning$/ do
  page.all(".bleat").first.should have_content("#winning")
end
