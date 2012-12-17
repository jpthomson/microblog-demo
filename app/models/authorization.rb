class Authorization < ActiveRecord::Base
  belongs_to :user
  belongs_to :auth_provider

  attr_accessible :uid
  
  def self.active(provider, uid)
    Authorization.
      joins(:auth_provider).
      where('env = ? and provider = ? and uid = ?', Rails.env, provider, uid).
      first
  end
end
