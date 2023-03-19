class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
    @orders = Order.where(customer_id: current_customer)
    @order_details = @order.order_datail
  end

  def show
    @order = order.find(params[:id])
  end
end
