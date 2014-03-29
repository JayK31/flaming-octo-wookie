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
    @item = Item.new(
      name: params[:item][:name],
      quantity: params[:item][:quantity],
      user_id: session[:user_id]
    )

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
    item.update(
      name: params[:item][:name],
      quantity: params[:item][:quantity]
      )

    redirect_to(item_path(item))
  end

  #items/:id DELETE
  def destroy
    item = Item.find(params[:id])
    item.destroy

    redirect_to("/items")
  end
end
