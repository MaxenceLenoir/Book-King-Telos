class AddMoneyToBuyer < ActiveRecord::Migration[6.1]
  def change
    add_monetize :buyers, :account_money, currency: { present: false }
  end
end
