class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all

    else
      can :read, :all
      cannot [:update, :destroy], [Product, User, Comment]
      cannot [:index, :show, :create], User
      cannot :create, Product
    end
  end
end