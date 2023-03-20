class Public::ItemsController < ApplicationController
  def index
    @items = Item.sales
    @active_items = @items.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
