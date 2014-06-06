class TripsController < ApplicationController

  # "/trips"
  def index
    #define current user in order to display trips for that user only
    @user = User.find(session[:user_id])
    @trips = Trip.where(user_id: @user.id).all
    @invites = Invite.where(user_id: params[:id]).all.map { |invite|
      invite.trip.start }
    @other_trips = @invites.map do |trip|
      Trip.where(start: trip)
    end
    

   

    # response = { trips: @trips, invites: @invites}

    respond_to do |format|
      format.json { render json: { trips: @trips, invites: @other_trips } }
      format.html
      end
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
      flash[:create_trip] = "Trip successfully created!"
      redirect_to trip_path(@trip)
    else
      flash[:error] = "Sorry, something went wrong. See the errors below and try again!"
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
    redirect_to trip_path(trip)
  end

  #/trips/:id DELETE
  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    flash[:destroy_trip] = "Trip successfully destroyed!"
    redirect_to trips_path
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
