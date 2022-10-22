class Public::HomesController < ApplicationController

  def top
    # bybug
    # ASCだと古い順でDESCで新着順。
    @items = Item.all
    @items_new = @items.order('id DESC').limit(4)
  end
  def about

  end

end
