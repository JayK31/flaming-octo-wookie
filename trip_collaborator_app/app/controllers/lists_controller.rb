class ListsController < ApplicationController

  #"/lists"
  def index
    @lists = List.all
  end

end
