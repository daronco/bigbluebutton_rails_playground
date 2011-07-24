module Shoulda
  module Matchers
    module ActiveRecord # :nodoc

      # Usage example: accept_nested_attributes_for(:address)
      def accept_nested_attributes_for(attribute)
        AcceptNestedAttributesForMatcher.new(attribute)
      end

      class AcceptNestedAttributesForMatcher < ValidationMatcher # :nodoc:
        def initialize(attribute)
          @attribute = attribute
        end

        def matches?(subject)
          @subject = subject

          method = "#{@attribute}_attributes="
          @subject.class.instance_methods.include?(method) or
            @subject.class.instance_methods.include?(method.to_sym)
        end

        def description
          "ensure #{@subject} accepts nested attributes for #{@attribute}"
        end

        def failure_message
          "Expected #{@subject} to accept nested attributes for #{@attribute}"
        end

        def negative_failure_message
          "Did not expected #{@subject} to accept nested attributes for #{@attribute}"
        end

      end
    end
  end
end
