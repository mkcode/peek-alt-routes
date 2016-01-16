module Peek
  module AltRoutes
    module RequestExtensions
      def peek_alt_routes?
        cookies['peek-alt-routes'] == 'true'
      end
    end
  end
end
