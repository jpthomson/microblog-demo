class User < ActiveRecord::Base
  attr_accessible :avatar_url, :bio, :email, :screen_name
  
  has_many :bleats
  
  devise :omniauthable
  
  has_many :authorizations
end
