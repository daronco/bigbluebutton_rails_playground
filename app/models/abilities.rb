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

      # Users
      can [:read], User
      can [:update, :destroy], User, :id => user.id

    end
  end

  class AnonymousAbility
    include CanCan::Ability

    def initialize
      can [:read], User
    end
  end

end
