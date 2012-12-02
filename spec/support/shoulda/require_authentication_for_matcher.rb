module Shoulda # :nodoc
  module Matchers
    module ActionController # :nodoc

      # Where this matcher expects the user to be redirected to
      # Set with:
      #   Shoulda::Matchers::ActionController.authentication_route = "/users/login"
      mattr_accessor :authentication_route

      # Ensures that authentication is required to access the action.
      # Assumes the user is redirected to new_user_session_path when
      # authentication is required.
      #
      # Options:
      # * <tt>via</tt> - Method to be used (defaults to get): :get, :post,
      #   :put, :delete.
      #
      # Example:
      #
      #   before { login_as(@user) }
      #   it { should require_authentication_for(:index) }
      #   it { should require_authentication_for(:destroy).via(:delete) }
      #   it { should_not require_authentication_for(:create, { :id => @post }).via(:post) }
      #   it { should_not require_authentication_for(:update, { :id => @post }).via(:put) }
      def require_authentication_for(action, params=nil)
        route = Shoulda::Matchers::ActionController.authentication_route || "/users/login"
        RequireAuthenticationForMatcher.new(action, self, route, params)
      end

      class RequireAuthenticationForMatcher # :nodoc:

        def initialize(action, context, auth_route, params=nil)
          @action = action
          @context = context
          @auth_route = auth_route
          @params = params
          @method = :get
        end

        def via(method)
          @method = method
          self
        end

        def matches?(controller)
          @controller = controller

          # we don't need to execute the real action to verify it
          @controller.stub(@action)
          begin
            @context.send(@method, @action, @params)
          rescue ActionView::MissingTemplate
          rescue CanCan::AccessDenied # authorization error, not authentication
          end

          @redirectTo = RedirectToMatcher.new(@auth_route, @context)
          @redirectTo.matches?(@controller)
        end

        def description
          "require authentication to access #{@method} => :#{@action}"
        end

        def failure_message
          "Expected #{@method} => :#{@action} to require authentication (#{@redirectTo.failure_message})"
        end

        def negative_failure_message
          "Did not expected #{@method} => :#{@action} to require authentication (#{@redirectTo.negative_failure_message})"
        end

      end
    end
  end
end
