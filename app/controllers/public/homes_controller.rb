class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.sales
    @active_items = @items.order('id DESC').limit(4)
  end

  def about
  end
end
