class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:

    # can :manage, Food, user: user
    # can :read, Recipe, user: user
    # can :manage, Recipe, user: user

    # user ||= User.new

    # can :read, Recipe do |recipe|
    #   recipe.public? || recipe.user == user
    # end

    # can :destroy, Recipe do |recipe|
    #   recipe.user == user
    # end

    # can :read, Food

    # can :destroy, Food do |food|
    #   food.user.id == user.id
    # end

    # can %i[create], :all

    return unless user.present?

    can :read, Recipe, user: user
    can :manage, Recipe, user: user
    can :manage, Food, user: user
    can :manage, RecipeFood, user: user
    return unless user.role == 'admin'

    can :manage, :all

    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
