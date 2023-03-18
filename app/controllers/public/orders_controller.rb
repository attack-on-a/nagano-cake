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
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
  end
end
