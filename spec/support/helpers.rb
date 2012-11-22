# General purpose helpers
module Helpers

  module ClassMethods

    # Sets the custom actions that should also be checked by
    # the matcher BeAbleToDoAnythingToMatcher
    def set_custom_ability_actions(actions)
      before(:each) do
        Shoulda::Matchers::ActiveModel::BeAbleToDoAnythingToMatcher.
          custom_actions = actions
      end
    end

  end

end
