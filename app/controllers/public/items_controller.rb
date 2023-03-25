class Public::ItemsController < ApplicationController
  def index
    @items = params[:name].present? ? Genre.find(params[:name]).Items : Item.saled
    @active_items = @items.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
