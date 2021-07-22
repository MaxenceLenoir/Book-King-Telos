class PaymentService
  def call(user)
    if user.account_money < user.cart.amount
      true
    else
      user.cart.update(state: "paid")
      user.decrement(:account_money_cents, user.cart.amount_cents)
      Cart.create(buyer: user)
      false
    end
  end
end
