module JSONAPIErrors
  module Rails
    module Controller
      extend ActiveSupport::Concern

      include Renderer

      included do
        rescue_from StandardError, with: :render
      end
    end
  end
end