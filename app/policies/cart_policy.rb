class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record == user.cart
  end

  def cart_payment?
    record == user.cart
  end
end
