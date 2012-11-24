module Shoulda # :nodoc
  module Matchers
    module ActionController # :nodoc

      # Ensures that the given action is not forbidden using cancan's
      # exception CanCan::AccessDenied.
      #
      # Options:
      # * <tt>via</tt> - Method to be used (defaults to get): :get, :post,
      #   :put, :delete.
      #
      # Example:
      #
      #   before { login_as(@user) }
      #   it { should deny_access_to(:index) }
      #   it { should deny_access_to(:destroy).via(:delete) }
      #   it { should_not deny_access_to(:create, { :id => @post }).via(:post) }
      #   it { should_not deny_access_to(:update, { :id => @post }).via(:put) }
      def deny_access_to(action, params=nil)
        DenyAccessToMatcher.new(action, self, params)
      end

      class DenyAccessToMatcher # :nodoc:

        def initialize(action, context, params=nil)
          @action = action
          @context = context
          @params = params
          @method = :get
        end

        def via(method)
          @method = method
          self
        end

        def matches?(controller)
          @controller = controller

          # we don't need to execute the real action to verify if it's accessible
          @controller.stub(@action)
          @controller.stub(:render)
          begin
            @context.send(@method, @action, @params)
          rescue CanCan::AccessDenied
            true
          rescue Exception => e
            throw e
          else
            false
          end
        end

        def description
          "deny access to #{@method} => :#{@action}"
        end

        def failure_message
          "Expected #{@method} => :#{@action} to deny access"
        end

        def negative_failure_message
          "Did not expected #{@method} => :#{@action} to deny access"
        end

      end
    end
  end
end
