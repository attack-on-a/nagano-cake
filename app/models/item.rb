class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details



  has_one_attached :image

  def get_item_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
