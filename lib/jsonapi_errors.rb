require "active_support"
require "active_support/concern"
require "active_support/core_ext/hash"
require "active_support/core_ext/class/attribute"
require "JSONAPI_errors/version"
require "JSONAPI_errors/configuration"
require "JSONAPI_errors/renderer"
require "JSONAPI_errors/rails/controller"

module JSONAPIErrors
  module Errors
    # Gem specific errors
    class UnhandledException < StandardError; end
  end
end
