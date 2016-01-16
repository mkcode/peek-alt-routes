require 'peek/alt-routes/request_extensions'

module Peek
  module AltRoutes
    class Railtie < ::Rails::Engine
      initializer 'peek.alt_routes.include_request_extensions' do
        ActiveSupport.on_load(:action_controller) do
          ActionDispatch::Request.send(:include, Peek::AltRoutes::RequestExtensions)
          delegate :peek_alt_routes?, to: :request
        end
      end
    end
  end
end
