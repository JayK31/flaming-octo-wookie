class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # by declaring these methods in ApplicationController
  # all other controller inheriti them

  #setting up session controller
  #assign current_user conditionally to current user using used_id
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #create predicate method logged_in to define if current user is logged in
  def logged_in?
    current_user.present?
  end

  # def require_admin
  #   if logged_in? && current_user.admin
  #     return true
  #   else
  #     flash[:error] = "Sorry, access denied. Be better."
  #     redirect_to(root_path)
  #   end
  # end

  # declare a method as a helper
  # http://api.rubyonrails.org/classes/AbstractController/Helpers/ClassMethods.html#method-i-helper_method
  # which means we can use the methods in the view as well
  helper_method(:current_user, :logged_in?)
end
