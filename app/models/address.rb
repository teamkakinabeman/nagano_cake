class Address < ApplicationRecord

  belongs_to :customer

  validates :postcode, presence: true , length: { maximum: 8 }
  validates :address, presence: true , length: { maximum: 161 }
  validates :name, presence: true , length: { maximum: 60 }

  def address_display
  '〒' + postcode + ' ' + address + ' ' + name
  end

end