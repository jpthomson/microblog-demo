# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create([
  { :name => 'admin' }, 
  { :name => 'user' },
], :without_protection => true)

example_user = User.create email: 'example@user.com', screen_name: 'Example User', avatar_url: 'default_user.png'
example_user.bleats.create content: 'An example bleat'

john_brunton = User.create email: 'john_brunton@hotmail.co.uk', screen_name: 'John Brunton'
john_brunton.add_role :admin

