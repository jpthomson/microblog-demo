class AuthorizationsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    authorization = Authorization.from_omniauth(auth_hash)
    
    if authorization.persisted?
      flash.notice = "Signed in!"
      sign_in authorization.user
      redirect_to request.env['omniauth.origin'] || '/'
    else
      session["devise.auth_hash"] = auth_hash
      redirect_to new_user_registration_url
    end
    
  end
  
  def failure
    render :text => "Sorry, but  byou didn't allow access to our app!"
  end
end
