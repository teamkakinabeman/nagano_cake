class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    if current_customer.cart_items.blank?
      redirect_to cart_items_path
    end
     @order = Order.new
     @addresses = current_customer.addresses.all
  end



  def create# Order に情報を保存します
    # ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
    cart_items = current_customer.cart_items.all
    # 渡ってきた値を @order に入れます
    @order = Order.new(order_params)
    if @order.save
      # 取り出したカートアイテムの数繰り返します
      # order_item にも一緒にデータを保存する必要があるのでここで保存します
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        # 購入が完了したらカート情報は削除するのでこちらに保存します
        order_detail.price = cart.item.unit_price
        # カート情報を削除するので item との紐付けが切れる前に保存します
        order_detail.save
      end
      redirect_to orders_thanks_path
      # ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
      cart_items.destroy_all
    else
      render 'new'
    end
  end


  # new 画面から渡ってきたデータをユーザーに確認してもらいます
   def confirm
    @postage = 800
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    # new 画面から渡ってきたデータを @order に入れます
    @order = Order.new(order_params)
     if params[:order][:address_number] == "1"
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name

        # collection.selectであれば
     elsif params[:order][:address_number] == "2"
        ship = Address.find(params[:order][:address_id])
        @order.postcode = ship.postcode
        @order.address = ship.address
        @order.name = ship.name

        # 新規住所入力であれば
     elsif params[:order][:address_number] = "3"
        @order.postcode = params[:order][:postcode]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
     else
            render 'new'
     end
   end


  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postage, :total_payment, :status, :payment_method, :postcode, :name, :address, :customer_id)
  end

  def address_params
    params.require(:order).permit(:postcode, :name, :address)
  end

end