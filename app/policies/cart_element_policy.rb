class CartElementPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.is_a?(Buyer)
  end

  def create?
    user.is_a?(Buyer)
  end

  def destroy?
    record.cart.buyer == user
  end
end
