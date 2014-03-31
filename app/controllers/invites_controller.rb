class InvitesController < ApplicationController

  def index
    @trip = Trip.find(params[:id])
    @invites = Invite.all
    @users = User.all
  end

  def new
    @trip = Trip.find(params[:id])
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(
      user_id: params[:invite][:user_id],
      trip_id: params[:invite][:trip_id]
      )

    if @invite.save
      redirect_to("/")
    else
      render :new
    end
  end

end

