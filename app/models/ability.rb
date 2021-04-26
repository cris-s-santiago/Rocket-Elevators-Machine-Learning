# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.employee?
      can :manage, :all
    elsif user.regular?
      can :read, Quote, user_id: user.id
      can :create, Quote
      can :update, Quote do |quote|
        quote.try(:user) == user
      end
      can :destroy, Quote do |quote|
        quote.try(:user) == user
      end
    else
      can :read #, Quote
    end
  end
end