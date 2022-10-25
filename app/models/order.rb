class Order < ApplicationRecord


 belongs_to :customer
 has_many :order_details
 has_many :items, through: :order_details


  enum payment_method: { credit_card: 0, transfer: 1}

  enum status: {

     waiting_deposit: 0,
     confirm_deposit: 1,
     in_production: 2,
     preparing_shipment: 3,
     shipped: 4
  }

end