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

    if @user.save
      # @current_user = User.find(@user.id)
      # session[:user_id] = @current_user.id
      redirect_to(user_path(@user))
    else
      render :new
    end
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
    user.update(user_params)

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


