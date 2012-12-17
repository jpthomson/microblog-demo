# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AuthProvider.create :provider => :developer,
  :name => 'Developer',
  :env => :development
  
AuthProvider.create :provider => :facebook,
  :name => 'Facebook',
  :env => :development,
  :key => '451564074911057',
  :secret => '79472d218d15752be627e5f0d0e8cb85'

AuthProvider.create :provider => :github,
  :name => 'Github',
  :env => :development,
  :key => 'cf81ea06f7bd85e75923',
  :secret => 'a147ff6d7765e3cc7635a7a8716d6582bee60e05'  

Role.create([
  { :name => 'admin' }, 
  { :name => 'user' },
], :without_protection => true)

example_user = User.create email: 'example@user.com', screen_name: 'Example User', avatar_url: 'default_user.png'
example_user.bleats.create content: 'An example bleat'

john_brunton = User.create email: 'john_brunton@hotmail.co.uk', screen_name: 'John Brunton'
john_brunton.add_role :admin
