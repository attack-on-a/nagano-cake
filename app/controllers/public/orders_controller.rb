class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=Customer.find(current_customer.id)
  end

  def confirm
    @order=Order.new(order_params)

  if params[:order][:select_address]=="1"
    @order.name = current_customer.name
    @order.post_code = current_customer.post_code
    @order.address = current_customer.post_address
   else
    render :new
   end

  elsif


  def complete
  end

  def create
    cart_items=current_customer.cart_items.all
    @order=current_customer.orders.new(order_params)
   if
    @order.save
    cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.item.id = cart.item_id
      order_item.order_id = @order.id
      order_item.order_amount = cart.amount
      order_item.order_price = cart.item.price

      order_item.save
    end
    redirect_to orders_confirm_path

    cart_items.destroy_all
   else
    @order = Order.new(order_params)
    render :new
   end
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:pay_method,:post_code,:name,:address)
  end
end
