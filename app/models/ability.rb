class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :trending, :to => :read
    
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :moderator
      can :manage, Bleat
      can :read, User
    else
      # can view any profile page
      can :show, User
      can :read, Bleat
      
      # can only edit own profile
      can :update, User, :id => user.id
      can [:create, :update, :destroy], Bleat, :user_id => user.id
    end
  end
end
