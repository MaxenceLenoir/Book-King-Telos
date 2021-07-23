class PaymentService
  def call(user)
    if user.can_pay_cart?
      user.cart.update(state: "paid")
      user.decrement(:account_money_cents, user.cart.amount_cents).save
      Cart.create(buyer: user)
      true
    else
      user.cart.update(state: "canceled")
      Cart.create(buyer: user)
      false
    end
  end
end
