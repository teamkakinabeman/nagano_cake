class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details
  has_many :items, through: :order_details

  has_one_attached :item_image

  enum is_on_sale: { on_sale: true, sold_out: false }

  def get_item_image
    (item_image.attached?) ? item_image : 'no_image.jpg'
  end

  def add_tax_price
        (self.unit_price * 1.08).round
  end

end
