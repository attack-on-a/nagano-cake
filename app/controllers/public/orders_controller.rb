class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
  end

  def confirm

    @order=Order.new(order_params)

      if params[:order][:select_address]=="1"
        @order_name = current_customer.last_name + current_customer.first_name
        @order_post_code = current_customer.post_code
        @order_address = current_customer.post_address

      elsif params[:order][:select_address]=="2"

        @address = Destination.find(params[:order][:destination_id])
        @order.name = @address.name
        @order.post_code = @address.post_code
        @order.address = @address.address
        
      elsif params[:order][:select_address]=="3"
        @order.name = params[:order][:name]
        @order.post_code = params[:order][:post_code]
        @order.address = params[:order][:address]
        @order.save
      else
        redirect_to request.referer
      end

      @cart_items = current_customer.cart_items.all
      @order.customer_id= current_customer.id
  end




  def create
    @order=Order.new(order_params)
    @order.customer_id= current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_item = OrderDetail.new
      @order_item.item_id = cart_item.item_id
      @order_item.order_id = @order.id
      @order_item.amount = cart_item.amount
      @order_item.total_price = cart_item.item.with_tax_price

      @order_item.save
    end

    redirect_to action: :complete
   # current_customer.cart_items.destroy_all
   end

  def complete
  end


  def index
    @orders = Order.where(customer_id: current_customer)

  end

  def show
    @order = Order.find(params[:id])
    @pay_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:payment, :post_code, :name, :address, :postage, :total, :order_status, :customer_id)
  end


end
