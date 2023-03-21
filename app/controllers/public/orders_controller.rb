class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
  end

  def confirm
    @order=Order.new(order_params)

      if params[:order][:select_address]=="1"
        @order.name = current_customer.last_name + current_customer.first_name
        @order.post_code = current_customer.post_code
        @order.address = current_customer.post_address

      elsif params[:order][:select_address]=="2"
      if Destination.exists?(params[:order][:destination_id])
          @address = Destination.find(params[:order][:destination_id])
          @order.name = @address.name
          @order.post_code = @address.post_code
          @order.address = @address.address
        else
          redirect_to request.referer
        end
      elsif params[:order][:select_address]=="3"
          @order.name = params[:order][:name]
          @order.post_code = params[:order][:post_code]
          @order.address = params[:order][:address]
   #     address_new = current_customer.addresses.new(address_params)
        else
          redirect_to request.referer
        end

      @cart_items = current_customer.cart_items.all
      @order.customer_id= current_customer.id
  end



  def complete
  end

  def create
    @order=Order.new(order_params)
    @order.customer_id= current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_item = OrderDetail.new
      @order_item.item.id = cart_item.item_id
      @order_item.order_id = @order.id
      @order_item.amount = cart_item.amount
      @order_item.total_price = cart_item.item.with_tax_price

      @order_item.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
   end

  def index
    @orders = Order.where(customer_id: current_customer)

  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_datail
  end

  private
  def order_params
    params.require(:order).permit(:payment,:post_code,:name,:address,:postage,:total,:order_status,:customer_id)
  end

 # def address_params
  #  params.require(:order).permit(:post_code,:address,:name)
 # end
end
