class Order < ApplicationRecord
  enum payment: { credit_card: 0, transfer: 1 }
  enum order_status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }

  has_many :order_detail
  has_many :items
end
