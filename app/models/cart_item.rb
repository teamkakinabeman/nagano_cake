class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

# カート内数量制限
  validates :amount, ength: { maximum: 20 }

  ## 小計を求めるメソッド
  def subtotal
      item.add_tax_price*amount
  end
end
