class UsersController < ApplicationController

  # "/users"
  def index
    @users = User.all
  end

  #form for creating new user
  def new
    @user = User.new
  end

  #users/ POST
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        #tell usermailer to send welcome email
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

    # if @user.save
    #   session[:user_id] = @user.id

    #   flash[:notice] = "Congratulations, you've successfully signed up!"
    #   redirect_to("/")

    # else
    #   flash[:error] = "Something went horribly wrong. Check the errors below!"
    #   render :new
    # end
  end

  #users/:id/
  def show
    @user = User.find(params[:id])
  end

  #form for updating user(similar to #new)
  #use partial
  #users/:id/edit
  def edit
    @user = User.find(params[:id])
  end

  #users/:id PUT
  def update
    user = User.find(params[:id])
    user.update(
      name: params[:user][:name],
      email: params[:user][:email]
      )

    redirect_to(user_path(user))
  end

  #users/:id DELETE
  def destroy
    user = User.find(params[:id])
    user.destroy
  redirect_to("/")
  end

  #create private method user_params to clean up create method(FMSC)
  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation )
  end
end

