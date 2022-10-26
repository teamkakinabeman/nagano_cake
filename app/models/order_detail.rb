class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum product_status: {cannot_make: 0, is_waiting: 1, is_making: 2, completed: 3 }


    ## 小計を求めるメソッド
  def subtotal
      item.add_tax_price*amount
  end

end
