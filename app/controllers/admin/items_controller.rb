class Admin::ItemsController < ApplicationController

  # ↓管理者以外はトップページにリダイレクトさせるコード　2022/10/20 一旦無効にしてます
  # before_action :if_not_admin

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を登録しました。"
      redirect_to admin_items_path
    else
      render 'index'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品を更新しました。"
      redirect_to admin_item_path(@item.id)
    else
      render 'edit'
    end
  end



  private

  # ↓管理者以外はトップページにリダイレクトさせるコード　2022/10/20 一旦無効にしてます
  # def if_not_admin
  #   redirect_to root_path unless customer_signed_in? && current_customer.admin?
  # end

  def item_params
    params.require(:item).permit(:name, :introduction, :unit_price, :is_on_sale, :item_image, :genre_id)
  end


end
