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

  # We can update or destroy a book only if it is available, eg : if no customer bought it or if it is currently in a cart

  def update?
    user == record.seller && record.available?
  end

  def destroy?
    user == record.seller && record.available?
  end
end
