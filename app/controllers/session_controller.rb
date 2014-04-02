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
      redirect_to("/")
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
    redirect_to("/")
  end

  def auth

  end

end
#     base_url = "https://api.twitter.com/oauth2/token"



# "Z0Zub3ZjOFE4UERHYnMwOFpBZHFXbDg5NzpzSzFtNnBVeHF5QW9nM2FrcU5z\ndmtDcjRmWDVFQzVnYWx5TTkyNTlqYnVBRDl5ZkVndw==\n"

#     auth = HTTParty.post(base_url,
#               :headers => {
#               'Authorization' => 'Basic Z0Zub3ZjOFE4UERHYnMwOFpBZHFXbDg5NzpzSzFtNnBVeHF5QW9nM2FrcU5zdmtDcjRmWDVFQzVnYWx5TTkyNTlqYnVBRDl5ZkVndw==',
#               'Content-Type' => 'application/x-www-form-urlencoded;charset=UTF-8',
#               'User-Agent' => 'Twitter'
#               },
#               :body => {
#               'grant_type' => 'client_credentials'
#               } )
