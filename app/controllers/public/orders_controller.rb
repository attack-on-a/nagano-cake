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
          @order.post_code = @address.post_code
          @order.address = @address.address
          @order.name = @address.name
        else
          render request.referer
        end
      elsif params[:order][:select_address]=="3"
          address_new = current_customer.addresses.new(address_params)
      if address_new.save
        else
          render request.referer
        end
        else
          redirect_to orders_complete_path
        end
      @cart_items = current_customer.cart_items.all
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
    redirect_to orders_confirm_path
   end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:pay_method,:post_code,:name,:address)
  end

  def address_params
    params.require(:order).permit(:post_code,:address,:name)
  end
end
