module JSONAPIErrors
  module Renderer
    def render(exception)
      raise Errors::UnhandledException unless data = JSONAPIErrors::Configuration.matches.fetch(exception.class.to_s, false)

      data.reverse_merge!({title: exception.class.to_s, detail: exception.message, status: "500"})

      {errors: [data]}
    end
  end
end
