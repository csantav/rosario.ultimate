class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :admin
      can :manage, :all
    elsif user.role? :moderator
      can :manage, [Comment, Post, Article, Page, Team]
    elsif user.role? :user
      can :read, [Comment, Post, Article, Page, Team]
      # manage products, assets he owns
      can :manage, Comment do |comment|
        comment.try(:owner) == user
      end
      can :manage, Team do |team|
        team.try(:owner) == user
      end
    end
  end
end