class Admin::OrderController < ApplicationController
  def show
    @order = Order.find(params[:id])

  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end
  
end
