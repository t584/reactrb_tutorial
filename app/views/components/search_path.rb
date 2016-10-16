# This class departs from 1 class/file and diretory
# structure/convention, using this to test search path

  class SearchPath
    include React::Component
    def render
      h1 {"::SearchPath"}
    end
  end

  module Home
    class SearchPath
      include React::Component
      def render
        h1 {"Home::SearchPath"}
      end
    end
  end

  module Components
    class SearchPath
      include React::Component
      def render
        h2 { 'Components::SearchPath' }
      end
    end
  end

  module Components
    module Home
      class SearchPath
        include React::Component
        def render
          h2 { 'Components::Home::SearchPath' }
        end
      end
    end
  end
