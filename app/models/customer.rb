class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
 has_many :orders,dependent: :destroy
 
  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :kana_last_name
    validates :kana_first_name
    validates :post_code
    validates :post_address
    validates :phone_number
    validates :email
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  has_many:cart_items

end
