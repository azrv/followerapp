class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return unless cookies[:user_id]
    @current_user ||= User.find_by(id: cookies[:user_id]) if cookies[:user_id]
  end
end
