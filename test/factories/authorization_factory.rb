FactoryGirl.define do
  sequence :uid do |n|
    "UID#{n}"
  end
  
  factory :authorization do
    uid
    provider 'developer'
    user 
  end
end