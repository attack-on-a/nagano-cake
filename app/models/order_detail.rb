class OrderDetail < ApplicationRecord
<<<<<<< HEAD
　has_many :order
　has_many :items
=======
  belongs_to :order
  belongs_to :item

  enum production_status: { production_not_possible: 0, production_pending: 1, in_production: 2, production_complete: 3 }
>>>>>>> origin/develop
end
