module JSONAPIErrors
  class Configuration
    # TODO create initialization into an intializer for rails
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
      true
    end

    def self.configure
      yield self
    end
  end
end
