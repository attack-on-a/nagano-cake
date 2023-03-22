class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer

    @pay_details =  @order.order_details

  end


  def update
      @order = Order.find(params[:id])
      @order_details = OrderDetail.where(order_id: params[:id])
  if  @order.update(order_params)
    if @order.order_status == "payment_confirmation"
      @order_details.update_all(production_status: 1)
      # 注文ステータスが「入金確認」とき、製作ステータスを全て「製作待ち」に更新する
      # update_all *条件に一致するレコードをすべて更新
      #  参考記事 https://qiita.com/yumaon/items/e70e01851d35fe865629
    end
  end
  redirect_to request.referer

  end

private
 def order_params
   params.require(:order).permit(:order_status)
 end

 def order_detail_params
    params.require(:order_detail).permit(:production_status)
 end

end
