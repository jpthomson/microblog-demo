class User < ActiveRecord::Base
  rolify
  devise :omniauthable

  attr_accessible :avatar_url, :bio, :email, :screen_name
  
  has_many :bleats  
  has_many :authorizations, :dependent => :destroy
  
  validates :email, :uniqueness => true
  
  before_save :default_values

  def default_values
    self.avatar_url ||= 'default_avatar.png'
  end
end
