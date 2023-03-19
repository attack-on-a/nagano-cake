class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=Customer.find(current_customer.id)
  end

  def confirm
  end

  def complete
  end

  def create
    @order=current_customer.orders.new(order_params)
   if
    @order.save
    redirect_to orders_confirm_path
   else
    render :new
   end
  end

  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:pay_method,:select_address)
  end
end
