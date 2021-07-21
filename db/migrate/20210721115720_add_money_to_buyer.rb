class AddMoneyToBuyer < ActiveRecord::Migration[6.1]
  def change
    add_monetize :buyers, :account_money, currency: { present: false }, amount: { default: 5_000 }
  end
end
