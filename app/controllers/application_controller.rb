class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user
  before_action :authenticate

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out(user)
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    redirect_to projects_path, notice: "Sign up or log in to view this page" unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def is_admin?
   !!current_user.instructor
  end
end
