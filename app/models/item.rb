class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  validates :price, numericality: { only_integer: true }

  with_options presence: true do
    validates:genre_id
    validates:name
    validates:explanatory
    validates:price
    validates:genre_id
  end

  has_one_attached :image

  def get_item_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def with_tax_price
    (price * 1.1).floor
  end

  def self.search_for(content)
    method = Item.saled.where('name LIKE ?', '%'+content+'%')
  end

  scope :saled, -> { where(is_active: true) }


end
