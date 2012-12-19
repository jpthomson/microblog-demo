class AuthProvider < ActiveRecord::Base
  attr_accessible :provider

  def self.active_provider(provider)
    AuthProvider.
      where(:provider => provider).
      first
  end
end
