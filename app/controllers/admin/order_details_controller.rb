class Admin::OrderDetailsController < ApplicationController

  def update
    order_detail = OrderDetail.find(params[:id])
    product_status = params[:order_detail][:product_status]
    order = order_detail.order

    order_detail.update(order_detail_params)
    order.update(status: "in_production") if product_status == "is_making"
    order.update(status: "preparing_shipment") if order.order_details.count == order.order_details.where(product_status: "completed").count

    redirect_to request.referer

  end

private
  def order_detail_params
      params.require(:order_detail).permit(:product_status)
  end

end
