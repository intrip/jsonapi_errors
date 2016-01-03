module JSONAPIErrors
  module Rails
    module Controller
      extend ActiveSupport::Concern

      include Renderer

      included do
        rescue_from StandardError, with: :render_error
      end

      #TODO set option to only and except for when using rescue_from

      def render_error(exception)
        response_h = render_h(exception)
        render json: response_h, status: response_h[:status].to_i
      end
    end
  end
end