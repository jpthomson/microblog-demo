class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      # can view any profile page
      can :show, User
      
      # can only edit own profile
      can :update, User, :id => user.id
      can [:create, :update, :destroy], Bleat, :user_id => user.id
    end
  end
end
