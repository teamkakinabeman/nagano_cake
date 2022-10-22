class Public::OrdersController < ApplicationController
  def new
     @order = Order.new
  end
  
  
  
  def create# Order に情報を保存します
    # ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
    cart_items = current_customer.cart_items.all
    # 渡ってきた値を @order に入れます
    @order = current_customer.orders.new(order_params)
    # ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
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
      redirect_to
      # ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
      cart_items.destroy.all
    else
      @order = Order.new(order_params)
      render :new
    end
  end


  # new 画面から渡ってきたデータをユーザーに確認してもらいます
  def confirm
    # new 画面から渡ってきたデータを @order に入れます
    @order = Order.new(order_params)
    # view で定義している address_number が"1"だったときにこの処理を実行します
    # form_with で @order で送っているので、order に紐付いた address_number となります。以下同様です
    if params[:order][:address_number] == "1"
      # @order の各カラムに必要なものを入れます
      @order.postcode = current_customer.postcode
      @order.name = current_customer.name
      @order.address = current_customer.address
      # view で定義している address_number が"2"だったときにこの処理を実行します
      # registered は viwe で定義しています
    elsif params[:order][:address_number] == "2"
      if Address.exists?(name: params[:order][:registered])
        @order.postcode = Address.find(params[:order][:registered]).postcode
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
      else
        # 既存のデータを使っていますのでありえないですが、万が一データが足りない場合は new を render します
        render :new
      end
      # 既存のデータを使っていますのでありえないですが、万が一データが足りない場合は new を render します
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
        # ここに渡ってくるデータはユーザーで新規追加してもらうので、入力不足の場合は new に戻します
        render :new
      end
    else
      # ありえないですが、万が一当てはまらないデータが渡ってきた場合の処理です
      redirect_to
    end
    # カートアイテムの情報をユーザーに確認してもらうために使用します
    @cart_items = current_customer.cart_items.all
  end

  def thanks
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :name, :address)
  end

  def address_params
    params.require(:order).permit(:postcode, :name, :address)
  end

end
