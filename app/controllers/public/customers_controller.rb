class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find.params[:id]
  end

  def edit
    @customer = Customer.find.params[:id]
  end

  def update
    @customer = Customer.find.params[:id]
    @customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  def soft_delete
  end

  def drop
  end

end
