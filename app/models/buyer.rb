class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :first_name, :last_name, :address, :password, presence: true
  monetize :account_money_cents
  has_one :cart
  has_many :carts, -> { no_scope }
  has_many :carts_paid, -> { paid }, class_name: "Cart"

  def name
    "#{first_name} #{last_name}"
  end
end
