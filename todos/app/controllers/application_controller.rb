class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    if !signed_in?
      redirect_to new_session_path
    end
  end

  def signed_in?
    current_user.signed_in?
  end

  def current_user
    User.new session[:current_email]
  end
end
