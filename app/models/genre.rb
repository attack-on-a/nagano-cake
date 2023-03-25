class Genre < ApplicationRecord
  has_many :items
  validates :name,presence: true

  scope :merge_genres, -> (genres){ }

  def self.search_for(content)
    method = Genre.where(name: content)
  end

end
