class InvitesController < ApplicationController

  def index
    @trip = Trip.find(params[:trip_id])
    @invites = Invite.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @invite = Invite.new
  end

  def create
    user = User.find_by(email: params[:invite][:email])
    @invite = Invite.new(
      trip_id: params[:invite][:trip_id],
      email: params[:invite][:email],
      user_id: user.id
      )

    if @invite.save
      redirect_to trip_invite_path(@invite.trip, @invite)
    else
      render :new
    end
  end

  def show
    @invite = Invite.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    @user = User.find(@invite.user_id)
    @items = Item.all
  end

  def destroy
    invite = Invite.find(params[:id])
    invite.destroy
    redirect_to trip_invites_path
  end

end

