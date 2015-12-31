module JSONAPIErrors
  class Configuration
    # TODO create initialization into an intializer for rails
    # then add all the defaults error for rails
    cattr_accessor :matches do
      Hash.new
    end

    def self.configure
      yield self
    end
  end
end
