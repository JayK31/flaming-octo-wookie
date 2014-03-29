class TripsController < ApplicationController

  # "/trips"
  def index
    #define current user in order to display trips for that user only
    @trips = Trip.all
    @current_user = User.find(session[:user_id])
  end

  #"/trips" --> direct to form
  def new
    @trip = Trip.new
  end

  #"/trips" POST
  def create
    @trip = Trip.new(
      start: params[:trip][:start],
      destination: params[:trip][:destination],
      user_id: session[:user_id]
    )

    if @trip.save
      redirect_to("/trips")
    else
      render :new
    end
  end

  #"/trips/:id"
  def show
    @trip = Trip.find(params[:id])
  end

  #"/trips/:id/edit" --> direct to form
  def edit
    @trip = Trip.find(params[:id])
  end

  #"/trips/:id" POST
  def update
    trip = Trip.find(params[:id])
    trip.update(
      start: params[:trip][:start],
      destination: params[:trip][:destination]
      )

    redirect_to("/trips")
  end

  #/trips/:id DELETE
  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    redirect_to("/trips")
  end
end
