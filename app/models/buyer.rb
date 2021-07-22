class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  monetize :account_money_cents
  validates :email, :first_name, :last_name, :address, presence: true
  validates :account_money_cents, numericality: { greater_than_or_equal_to: 0 }
  has_one :cart, -> { pending }
  has_many :carts
  has_many :carts_paid, -> { paid }, class_name: "Cart"
  has_many :cart_elements, through: :cart

  def name
    "#{first_name} #{last_name}"
  end

  def notifs_counter
    cart_elements.count
  end
end
