class ApplicationController < ActionController::Base
  helper_method :current_user, :require_login

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    if !current_user
      flash["error"] = "You must be logged in to do that."
      redirect_back fallback_location: root_path
    end
  end
end
