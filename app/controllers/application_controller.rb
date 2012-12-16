class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    puts "*** #{exception.message}"
    redirect_to root_path, :alert => exception.message
  end
end
