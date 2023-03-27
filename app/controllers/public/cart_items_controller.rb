class Public::CartItemsController < ApplicationController
  before_action:authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.page(params[:page])
    @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    # 同じitemがあるか判別
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        amount = cart_item.amount + @cart_item.amount
        cart_item.update(:amount => amount)
        @cart_item.delete
      end
    end

    if @cart_item.save
      redirect_to cart_items_path
    else
      redirect_to cart_items_path
    end
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end

end