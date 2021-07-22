class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.includes(:carts).all
    end
  end

  def create?
    user.is_a?(Seller)
  end

  def show?
    true
  end

  def update?
    user == record.seller
  end

  def destroy?
    user == record.seller
  end
end
