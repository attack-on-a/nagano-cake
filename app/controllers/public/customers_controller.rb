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

  private
  def customer_params
    params.require(:customers).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :post_code, :post_address, :phone_number, :email, :is_deleted)
  end
end
