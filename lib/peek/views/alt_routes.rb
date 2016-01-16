module Peek
  module Views
    class AltRoutes < View
      attr_reader :name
      # A view that allows for quick toggling of alternative routes.
      #
      # name - Text that will be displayed in the peek bar. The name
      #        of the feature or pages that will be toggled.
      #
      # Returns Peek::Views::AltRoutes
      def initialize(options = {})
        @name = options.fetch(:name, 'Alternate Routes')
      end
    end
  end
end
