class Authorization < ActiveRecord::Base
  belongs_to :user

  attr_accessible :provider, :uid
  
  def self.from_omniauth(auth_hash)
    where(:provider => auth_hash.provider, :uid => auth_hash.uid).first_or_initialize do |auth|
      auth.provider = auth_hash.provider
      auth.uid = auth_hash.uid
    end
  end
end
