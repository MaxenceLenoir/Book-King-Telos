class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :first_name, :last_name, :phone, presence: true

  has_many :books, -> { includes(:carts) }
  has_many :books_sold, -> { includes(cart_elements: :cart).where(cart_elements: { carts: { state: "paid" } }) }, class_name: "Book"

  def name
    "#{first_name} #{last_name}"
  end
end
