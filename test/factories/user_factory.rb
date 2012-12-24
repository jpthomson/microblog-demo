FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end
  
  sequence :screen_name do |n|
    "Example User #{n}"
  end
  
  factory :user do
    email
    screen_name
    password 'asdasd'
  end
end
