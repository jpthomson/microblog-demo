Then /^the "(.*?)" panel should be visible$/ do |panel_name|
  page.should have_selector("##{panel_name}")
end

Then /^the "(.*?)" panel should not be visible$/ do |panel_name|
  page.should_not have_selector("##{panel_name}")
end
