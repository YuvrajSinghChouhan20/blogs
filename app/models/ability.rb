class Ability
  include CanCan::Ability

  def initialize(user)
    can [:index], Article, public: true

    return unless user.present?

    if  user.has_role? :user
      can [:read, :create], Article
    end

    if user.has_role? :author
      can :manage, Article
    end
  end
end
