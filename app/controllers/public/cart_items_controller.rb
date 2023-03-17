class Public::CartItemsController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @cart_items = @customer.cart_items.all
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @customer = Customer.find(params[:customer_id])
    @cart_items = @customer.cart_items.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
  end

end
