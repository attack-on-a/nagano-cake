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

  end

  def show
    @order = order.find(params[:id])
    @order_details = @order.order_datail
  end
end
