class User < ActiveRecord::Base
  attr_accessible :avatar_url, :bio, :email, :screen_name
end
