module JSONAPIErrors
  class Configuration
    # TODO create rake task that creates a rails initializer
    # TODO add all the default rails exception
    # all the exceptions matched
    cattr_accessor :matches do
      {
          # Rails ActiveRecord::#save! error
          "ActiveRecord::RecordInvalid" => {
              status: "422",
              code: "422"
          }
      }
    end

    # if enabled return a json with unhandlex exception explanation
    # otherwise just raises the exception
    cattr_accessor :catch_unhandled_exceptions do
      false
    end

    def self.configure
      yield self
    end
  end
end
