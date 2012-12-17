class AuthorizationsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    
    authorization = Authorization.active(auth_hash[:provider], auth_hash[:uid])
    
    if authorization
      user = authorization.user
    else
      user = User.where(:email => auth_hash["info"]["email"]).first
      user = create_user(auth_hash) unless user
      authorize_user(user, auth_hash)
      user.save
    end
    
    sign_in user
    redirect_to request.env['omniauth.origin'] || '/'
  end
  
  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
  
  private
  def authorize_user(user, auth_hash)
    authorization = user.authorizations.build :uid => auth_hash["uid"]
    authorization.auth_provider = AuthProvider.active_provider(auth_hash["provider"])    
  end

  def create_user(auth_hash)
    User.new :screen_name => auth_hash["info"]["name"],
      :email => auth_hash["info"]["email"]
  end  
end
