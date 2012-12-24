When /^I compose a bleat with content "(.*?)"$/ do |content|
  click_link 'Compose'
  within("#compose") do
    fill_in 'bleat[content]', :with => content
  end
  click_button 'post'
end
