class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :first_name, :last_name, :address, :password, presence: true
  monetize :account_money_cents

  def name
    "#{first_name} #{last_name}"
  end
end
