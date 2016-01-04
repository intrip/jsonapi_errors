module JSONAPIErrors
  class HashRenderer
    attr_reader :exception

    def initialize(exception)
      @exception = exception
    end

    def render
      return unhandled_exception_error unless data = JSONAPIErrors::Configuration.matches.fetch(@exception.class.to_s, false)
      data.reverse_merge!({title: @exception.class.to_s, detail: @exception.message, status: "500"})
      {errors: [data]}
    end

    private

    def unhandled_exception_error
      unhandled_exception_error! unless JSONAPIErrors::Configuration::catch_unhandled_exceptions
      {errors: [{title: "Unhandled exception", detail: "The Exception: #{@exception.class.name} #{@exception.message}. is not handled in configuration.matches.", status: "500"}]}
    end

    def unhandled_exception_error!
      raise @exception
    end
  end
end
