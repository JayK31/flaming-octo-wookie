class ItemsController < ApplicationController

  # trips/:id/items
  def index
    @items = Item.all
    @current_user = User.find(session[:user_id])
    @trip = Trip.find(params[:id])
  end

  # trips/:/id/items/new --> form
  def new
    @item = Item.new
    @trip = Trip.find(params[:id])
  end

  #trips/:id/items POST
  def create
    @item = Item.new(item_params)
    #have to assign user_id during create, can't pass it using require because it is not a parameter we're getting from user
    @item[:user_id] = session[:user_id]
    @item[:trip_id] = params[:trip_id].first[0].to_i

    if @item.save
      redirect_to("/")
    else
      render :new
    end
  end

  #trips/:id/items/:id
  def show
    @item = Item.find(params[:id])
    @trip = Trip.find(@item.trip_id)
    @user = User.find(session[:user_id])
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

    redirect_to("/")
  end

  #trips/:id/items/:id DELETE
  def destroy
    item = Item.find(params[:id])
    item.destroy

    redirect_to("/trips")
  end

  #create private method user_params to clean up create method(FMSC)
  private
  def item_params
    params.require(:item).permit(
      :name,
      :quantity,
      :trip_id,
      :is_claimed,
      :description,
      :user_id
      )
  end
end
