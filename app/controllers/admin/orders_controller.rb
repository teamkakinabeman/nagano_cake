class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @orders = @order.order_details.all
    @postage = 800

  end

  def update
    @order = Order.find(params[:id])
    status = params[:order][:status].to_i
    @order.update(status: status)
    redirect_to admin_order_path(@order), notice: '注文ステータスを更新しました'

  end

end
