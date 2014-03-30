class TripsController < ApplicationController

  # "/trips"
  def index
    #define current user in order to display trips for that user only
    # @trips = Trip.all

    # @trips = Trip.find_by(user_id: params[:user_id])
    @trips = Trip.all
    @user = User.find(params[:id])

    # @current_user ||= User.find(@user.id)
  end

  #"/trips" --> direct to form
  def new
    @trip = Trip.new
  end

  #"/trips" POST
  def create
    @trip = Trip.new(trip_params)
    #have to assign user_id during create, can't pass it using require because it is not a parameter we're getting from user
    @trip[:user_id] = session[:user_id]

    if @trip.save
      redirect_to("/")
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
    trip.update(trip_params)

    redirect_to("/trips")
  end

  #/trips/:id DELETE
  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    redirect_to("/trips")
  end

#create private method user_params to clean up create method(FMSC)
  private
  def trip_params
    params.require(:trip).permit(
      :start,
      :destination
     )
  end
end
