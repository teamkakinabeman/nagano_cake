class Item < ApplicationRecord

  belongs_to :user

  has_one_attached :item_image


  def get_item_image
    (item_image.attached?) ? item_image : 'no_image.jpg'
  end

end
