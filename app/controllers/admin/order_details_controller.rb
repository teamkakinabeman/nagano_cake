class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    product_status = params[:order_detail][:product_status].to_i
    order_detail.update(product_status: product_status)
    redirect_to request.referer, notice: '製作ステータスを更新しました'
  end
end
