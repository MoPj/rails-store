class StoreController < ApplicationController

  def index
    @categories = Category.order(:title)
    @items = Item.order(:title)
  end
  
end