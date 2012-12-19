class Authorization < ActiveRecord::Base
  belongs_to :user

  attr_accessible :provider, :uid
  
  def self.active(provider, uid)
    Authorization.
      where('provider = ? and uid = ?', provider, uid).
      first
  end
end
