# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AuthProvider.create :provider => :developer
AuthProvider.create :provider => :facebook
AuthProvider.create :provider => :github

Role.create([
  { :name => 'admin' }, 
  { :name => 'user' },
], :without_protection => true)

example_user = User.create email: 'example@user.com',
  screen_name: 'Example User',
  avatar_url: 'default_user.png',
  bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec molestie faucibus suscipit.',
  password: 'Password1'

example_user.bleats.create content: 'Lorem ipsum #dolor sit amet, consectetur adipiscing elit.'
example_user.bleats.create content: 'In sit amet lectus #dolor, nec ultricies neque.'
example_user.bleats.create content: 'Quisque condimentum orci id leo adipiscing ullamcorper.'
example_user.bleats.create content: 'Mauris sollicitudin velit convallis tellus #bibendum id sollicitudin nunc euismod.'
example_user.bleats.create content: 'Mauris #suscipit, erat ac ultricies volutpat, diam.'

john_brunton = User.create email: 'john_brunton@hotmail.co.uk',
  screen_name: 'John Brunton',
  avatar_url: 'https://en.gravatar.com/userimage/30550187/0064f04f15fe2377b08f71cce4afb0ce.png?size=200',
  password: Devise.friendly_token[0,20]
  
john_brunton.add_role :admin
