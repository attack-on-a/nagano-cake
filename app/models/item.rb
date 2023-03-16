class Item < ApplicationRecord
  belongs_to :genre




  has_one_attached :image

  def get_item_image
    (image.attached?) ? image : 'no_image.jpg'
  end



end
