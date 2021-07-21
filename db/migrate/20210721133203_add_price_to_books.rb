class AddPriceToBooks < ActiveRecord::Migration[6.1]
  def change
    add_monetize :books, :price, currency: { present: false }
  end
end
