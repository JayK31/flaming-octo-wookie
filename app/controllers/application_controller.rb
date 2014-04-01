class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #moved methods to AppHelper module

  # def current_trip
  #   @current_trip ||= Trip.find_by(id: session[:trip_id])
  # end

  # def trip_leader?
  #   return true if @current_trip.user_id == @current_user.id
  # end

  # def current_trip
  #   @current_trip ||= Trip.find(session[:trip_id])
  # end

 # def signed_up
 #    @user_email = User.find_by(email: session[:email])
 #    @all_users = User.all
 #    if @all_users.email.include? @user_email
 #      return true
 #    else
 #      flash[:error] = "Sorry, that e-mail address does not exist. Please sign up!"
 #      redirect_to("/session/new")
 #    end
 #  end
end


=begin
  else
   26:       flash[:error] = "Dude. Only administrators can do that. Are YOU an admin? Nuh-uh."
   27        redirect_to(root_path)
   28      end
=end

