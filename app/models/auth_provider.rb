class AuthProvider < ActiveRecord::Base
  attr_accessible :provider, :name, :key, :secret, :env

  # returns the active providers for the current environment  
  def self.active_providers
    if table_exists?
      AuthProvider.where(:env => Rails.env)
    else
      []
    end
  end
  
  def self.active_provider(provider)
    AuthProvider.
      where(:env => Rails.env, :provider => provider).
      first
  end
end
