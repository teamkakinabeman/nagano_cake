class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @postage = 800
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

    if params[:order][:status] == "confirm_deposit"
     @order.order_details.update(product_status: "is_waiting")
    end
    redirect_to admin_order_path(@order)
  end

private

 def order_params
   params.require(:order).permit(:status)
 end
end
