class BuyerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user == record
  end

  def update?
    user == record
  end
end
