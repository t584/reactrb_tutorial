# module ::React
#   module Component
#     module DslInstanceMethods
#       def state(*args)
#         @state_wrapper ||= StateWrapper.new(@native, self)
#         if args.count > 0
#           @state_wrapper.method_missing(*args)
#         else
#           @state_wrapper
#         end
#       end
#     end
#   end
# end

module ::React
  module Component
    module DslInstanceMethods
      def state(state = nil)
        @state_wrapper ||= StateWrapper.new(@native, self)
        if state
          @state_wrapper.method_missing(state)
        else
          @state_wrapper
        end
      end
      def state!(s, *args)
        state.method_missing("#{s}!", *args)
      end
    end
  end
end
