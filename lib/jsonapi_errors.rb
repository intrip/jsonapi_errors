require "active_support"
require "active_support/concern"
require "active_support/core_ext/hash"
require "active_support/core_ext/class/attribute"
require "jsonapi_errors/version"
require "jsonapi_errors/configuration"
require "jsonapi_errors/hash_renderer"
require "jsonapi_errors/rails/controller"

module JSONAPIErrors
  module Errors
    # Gem specific errors
    class UnhandledException < StandardError; end
  end
end
