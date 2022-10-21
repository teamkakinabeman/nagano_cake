class Item < ApplicationRecord

  belongs_to :genre

  has_one_attached :item_image

  enum is_on_sale: { 販売中: true, 売切れ: false }

  def get_item_image
    (item_image.attached?) ? item_image : 'no_image.jpg'
  end

end
