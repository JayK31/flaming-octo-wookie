class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #create predicate method logged_in to define if current user is logged in
  def logged_in?
    current_user.present?
  end

  helper_method(:current_user, :logged_in?)
end
