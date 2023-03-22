class Admin::OrderDetailsController < ApplicationController
  def update

     @order_detail = OrderDetail.find(params[:id])
     @order = @order_detail.order
     @order_detail.update(order_detail_params)

     if @order_detail.production_status == in_production
         @order.update(order_status:3)
      # is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新されます。上記のif文でis_updatedがfalseになっている場合、更新されません。
      elsif @order.order_details.count == @order.order_details.where(production_status: "production_complete").count
      @order.update(order_status:"preparing_delivery")
      end
      redirect_to request.referer
     end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)

  end

end
