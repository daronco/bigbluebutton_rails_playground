# Checks if a value is included in an array.
# Examples:
#   it { "one".should be_included_in_array(["one", "two"]) }
#   it { "three".should be_included_in_array(["one", "two"]) }
module Shoulda
  module Matchers
    module ActiveModel # :nodoc

      def be_included_in_array(array)
        BeIncludedInArrayMatcher.new(array)
      end

      class BeIncludedInArrayMatcher < ValidationMatcher # :nodoc:
        def initialize(array)
          @array = array
        end

        def matches?(subject)
          @subject = subject
          @array.include? @subject
        end

        def description
          "the value #{@subject} be included in the array #{@array}"
        end

        def failure_message
          "Expected #{@subject} to be included in the array #{@array}"
        end

        def negative_failure_message
          "Expected #{@subject} not to be included in the array #{@array}"
        end

      end
    end
  end
end
