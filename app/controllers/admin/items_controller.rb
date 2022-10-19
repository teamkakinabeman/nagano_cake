class Admin::ItemsController < ApplicationController

  # ↓管理者以外はトップページにリダイレクトさせるコード
  before_action :if_not_admin

  def index
    @items = Items.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を登録しました。"
      redirect_to admin_item_path(@item.id)
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

  # ↓管理者以外はトップページにリダイレクトさせるコード
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :unit_price, :is_on_sale)
  end


end
