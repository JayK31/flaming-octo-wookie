class ItemsController < ApplicationController

  # /items
  def index
    @items = Item.all
    @current_user = User.find(session[:user_id])
  end

  # items/new --> form
  def new
    @item = Item.new
  end

  #items POST
  def create
    @item = Item.new(item_params)
    #have to assign user_id during create, can't pass it using require because it is not a parameter we're getting from user
    @item[:user_id] = session[:user_id]

    if @item.save
      redirect_to("/items")
    else
      render :new
    end
  end

  #items/:id
  def show
    @item = Item.find(params[:id])
  end

  #items/:id/edit --> form
  def edit
    @item = Item.find(params[:id])
  end

  #items/:id POST
  def update
    item = Item.find(params[:id])
    item.update(item_params)

    redirect_to(item_path(item))
  end

  #items/:id DELETE
  def destroy
    item = Item.find(params[:id])
    item.destroy

    redirect_to("/items")
  end

  #create private method user_params to clean up create method(FMSC)
  private
  def item_params
    params.require(:item).permit(
      :name,
      :quantity
    )
  end
end
