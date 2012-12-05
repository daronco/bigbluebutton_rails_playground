# Based on https://gist.github.com/3729390/
module Abilities

  def self.ability_for(user)
    if user and user.superuser?
      SuperUserAbility.new(user)
    elsif user and !user.anonymous?
      MemberAbility.new(user)
    else
      AnonymousAbility.new
    end
  end

  class SuperUserAbility
    include CanCan::Ability

    def initialize(user)
      can :manage, :all
    end
  end

  class MemberAbility
    include CanCan::Ability

    def initialize(user)

      # Frontpage
      can :read, :frontpage

      # Users
      can :read, User
      can [:update, :destroy], User, :id => user.id

      # Profile
      can [:read, :update], Profile, :user_id => user.id

      # Home
      can :read, :home

      # Webconf rooms
      can [:invite, :auth, :running, :join, :join_mobile], BigbluebuttonRoom
      can :end, BigbluebuttonRoom, :owner_type => "User", :owner_id => user.id

    end
  end

  class AnonymousAbility
    include CanCan::Ability

    def initialize

      # Frontpage
      can :read, :frontpage

      # Webconf rooms
      # TODO: :join and :join_mobile should be allowed too?
      can [:invite, :auth, :running], BigbluebuttonRoom

    end
  end

end
