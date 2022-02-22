class BookingPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
    end
  end

  def index?
  end

  def show?
    return true
  end

  def new?
  end

  def create?
    return true
  end

end
