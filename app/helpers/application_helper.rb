module ApplicationHelper
  #methods here can be accessed anywhere in app, just include AppHelper

  #setting up session controller
  #assign current_user conditionally to current user using used_id
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #create predicate method logged_in to define if current user is logged in
  def logged_in?
    current_user.present?
  end
end
