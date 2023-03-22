class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment: { credit_card: 0, transfer: 1 }
  enum order_status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }
  
    with_options presence: true do
    validates :name
    validates :post_code
    validates :address
    validates :postage
    validates :total
  end
end
