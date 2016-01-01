module JSONAPIErrors
  class Configuration
    # TODO create initialization into an intializer for rails
    # then add all the defaults error for rails
    cattr_accessor :matches do
      {
          # Rails ActiveRecord::#save! error
          "ActiveRecord::RecordInvalid" => {
              status: "422",
              code: "422"
          }
      }
    end

    def self.configure
      yield self
    end
  end
end
