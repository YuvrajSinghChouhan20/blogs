# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can [:index], Article, public: true

    return unless user.present?

    can %i[read create], Article if user.has_role? :user

    can :manage, Article if user.has_role? :author
  end
end
