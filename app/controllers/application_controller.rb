class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :admin?
  def current_user
   User.find_by_id(session[:user_id])
 end

 def admin?
    if current_user.admin == true
      return true
    else
      return false
    end
  end

 def authenticate
   redirect_to login_path, :alert => 'You need to be logged in to see this.' if not current_user
 end

end
