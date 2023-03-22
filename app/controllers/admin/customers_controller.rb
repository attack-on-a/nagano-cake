class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  def orders
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.order('id DESC').page(params[:page])
    @view_line = @orders
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :post_code, :post_address, :phone_number, :email, :is_deleted)
  end
end
