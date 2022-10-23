class Public::CartItemsController < ApplicationController

 def create
  @cart_item = CartItem.new(cart_items_params)
		@cart_item.customer_id = current_customer.id
		if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
			@cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
			@cart_item.amount += params[:cart_item][:amount].to_i
			@cart_item.save
		# 	flash[:notice] = "Item was successfully added to cart."
			redirect_to cart_items_path
		else @cart_item.save
		# 	flash[:notice] = "New Item was successfully added to cart."
			redirect_to cart_items_path
		end
 end

 def index
  @cart_items = current_customer.cart_items.all

  # カートに入ってる商品の合計金額
  @total_payment = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
 end

 def update
  cart_item = CartItem.find(params[:id])
  cart_item.update(cart_items_params)
  redirect_to request.referer

 end

 def destroy
  cart_item = CartItem.find(params[:id])
  cart_item.destroy
  redirect_to request.referer
 end


 def destroy_all
  @cart_items = CartItem.all
  current_customer.cart_items.destroy_all
  redirect_to request.referer
 end

 private

 def cart_items_params
  params.require(:cart_item).permit(:item_id, :amount)
 end

end

