class Genre < ApplicationRecord
  has_many :items
  validates :name,presence: true

  scope :merge_genres, -> (genres){ }

  def self.search_items_for(content)

    if method == 'perfect'
      genres = Genre.where(name: content)
    end

    return genres.inject(init = []) {|result, genre| result + genre.items}

  end
end
