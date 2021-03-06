class Ability
  include CanCan::Ability

  # 'current_user' is being passed in as local variable 'current_user'. The helper method #current_user is unavailable
  def initialize(current_user)

    # Define abilities for the passed in user here. For example:
    current_user ||= User.new # guest user (not logged in)


    if current_user.admin?
      can :manage, :all
    else
      can [:new, :create],  User
      can [:show, :profile, :update], User do |user_record|
        current_user.id == user_record.id
      end
    end



    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
