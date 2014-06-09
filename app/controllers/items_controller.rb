class ItemsController < ApplicationController

  # trips/:id/items
  def index
    @items = Item.all
    trip = Trip.find(params[:trip_id])
    @items = Item.where(trip_id: trip.id).all

    respond_to do |format|
      format.json { render json: @items }
      format.html
    end
  end

  # trips/:/id/items/new --> form
  def new
    @trip = Trip.find(params[:trip_id])
    @item = Item.new(:trip=>@trip)
  end

  #trips/:id/items POST
  def create
    @item = Item.new(item_params)
    #have to assign user_id during create, can't pass it using require because it is not a parameter we're getting from user
    @item[:user_id] = session[:user_id]
    @trip = Trip.find(params[:trip_id])
    @item[:trip_id] = @trip.id
   

    if @item.save
      redirect_to trip_item_path(@item.trip, @item)
    else
      render :new
    end
  end

  #trips/:id/items/:id
  def show
    @item = Item.find(params[:id])
    @trip = Trip.find(@item.trip_id)
    @user = User.find(session[:user_id])

    respond_to do |format|
      format.json { render json: @item }
      format.html
    end
  end

  #trips/:id/items/:id/edit --> form
  def edit
    @item = Item.find(params[:id])
    @trip = Trip.find(@item.trip_id)
  end

  #trips/:id/items/:id PUT
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to trip_item_path(@item.trip, @item)
  end

  #trips/:id/items/:id DELETE
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to trip_items_path
  end

  #create private method user_params to clean up create method(FMSC)
  private
  def item_params
    params.require(:item).permit(
      :name,
      :quantity,
      :is_claimed,
      :description,
      :user_id,
      :trip_id
      )
  end
end
