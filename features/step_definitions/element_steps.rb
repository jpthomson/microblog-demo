Then /^the "(.*?)" panel should be visible$/ do |panel_name|
  page.should have_selector("##{panel_name}")
end

Then /^the "(.*?)" panel should not be visible$/ do |panel_name|
  page.should_not have_selector("##{panel_name}")
end

Then /^a[n]? "(.*?)" should be visible$/ do |class_name|
  page.should have_selector(".#{class_name}")
end

Then /^the content "(.*?)" should be visible"$/ do |content|
  page.should have_content(content)
end

Then /^the content "(.*?)" should be visible$/ do |arg1|
  page.should have_content(arg1)
end