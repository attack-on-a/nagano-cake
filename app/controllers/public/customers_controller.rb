class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = Customer.find8params[:id]
  end

  def update
  end

  def soft_delete
  end

  def drop
  end

end
