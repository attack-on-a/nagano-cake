class Item < ApplicationRecord
  belongs_to :genre

  validates :genre_id, :name, presence: true
end
