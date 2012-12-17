class User < ActiveRecord::Base
  rolify
  devise :omniauthable

  attr_accessible :avatar_url, :bio, :email, :screen_name
  
  has_many :bleats  
  has_many :authorizations, :dependent => :destroy
  
  validates :email, :uniqueness => true
end
