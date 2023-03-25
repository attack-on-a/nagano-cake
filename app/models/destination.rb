class Destination < ApplicationRecord
  belongs_to :customer
 
  validates :name, :address, :post_code, presence: true

  def address_display
  '〒' + post_code + ' ' + address + ' ' + name
  end
end
