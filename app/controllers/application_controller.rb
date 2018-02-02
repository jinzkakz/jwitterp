class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private 
  def logged_in?
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
  end
    
    def current_user
        if logged_in?
            @user ||= User.find_by(user_id: session[:user_id])
        end
    end

  helper_method :logged_in?, :current_user
end
