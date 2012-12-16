class AuthorizationsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    
    if @authorization
      user = @authorization.user
    else
      # TODO: unsuitable for production, but makes it easier to match up facebook auths with seed data
      user = User.find_by_email(auth_hash["info"]["email"])
      
      user = create_user_from_hash(auth_hash) unless user
      user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      user.save
    end
    
    sign_in user
    redirect_to request.env['omniauth.origin'] || '/'
  end
  
  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
  
  private
  def create_user_from_hash(auth_hash)
    User.new :screen_name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
  end
end
