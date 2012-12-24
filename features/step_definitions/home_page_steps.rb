Given /^a(?: new)? bleat with the content "(.*)"$/ do |content|
  create(:bleat, :content => content)
end

Given /^(\d+) bleats exist$/ do |count|
  for k in 1..count.to_i do
    create(:bleat)
  end
end

When /^I visit the home page$/ do
  visit root_url
end

Then /^the first bleat on the home page should contain "(.*)"$/ do |content|
  page.all(".bleat").first.should have_content(content)
end

Then /^"(.*?)" should be a trending hashtag$/ do |hashtag|
  page.all(".trending").first.should have_content(hashtag)
end
