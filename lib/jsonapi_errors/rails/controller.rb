module JSONAPIErrors
  module Rails
    module Controller
      extend ActiveSupport::Concern

      include Renderer
    end
  end
end