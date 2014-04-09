class SessionController < ApplicationController

  #routes to new session form
  def new
  end

  def create
    #find user by given email
    user = User.find_by(email: params[:email])


    #check if we found user and they gave us correct password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    #store user id in session in key 'session'
    else
      render(:new)
      #if not authenticated, render back to new form
      #soon will add flash[:error]
    end
  end

  def destroy
    #in destroy action, setting session: user_id to nil
    session[:user_id] = nil
    redirect_to root_path
  end

end
