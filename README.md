# JSONAPIErrors

JSONAPIErrors is a Framework agnostic gem to handle errors compliant to [JSON API standard](http://jsonapi.org).
The gem at the moment is integrated with Rails ActionController but if there is some interest we can integrate the gem
with other popular Ruby frameworks such as Sinatra or Lotus.

The idea is to handle errors with ruby exceptions. When an exception is raised the application tries to match the exception classname
with the matched exception list and if the exception is found renders a json response confirm to [JSONAPI errors standard](http://jsonapi.org/format/#errors).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'JSONAPI_errors'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install JSONAPI_errors

Then
```ruby
include  JSONAPIErrors::Rails::Controller
```
in your application_controller.rb or
in the controllers where you need to enable the gem.

## Usage

Add an element to the "JSONAPIErrors::Configuration.matches" hash for every exception error you need to handle.
Here is an example:
```ruby
 JSONAPIErrors::Configuration.matches = {
      # exception class name
      "JSONAPIErrors::MatchedException" => {
          #  a unique identifier for this particular occurrence of the problem.
          id: "1",
          # a links object that follows [JSON API ERRORS standard](http://jsonapi.org/format/#errors)
          links: "",
          # the HTTP status code applicable to this problem, expressed as a string value.
          # this value is equal to the response status code generated
          status: "422",
          # an application-specific error code, expressed as a string value.
          code: "422",
          # A short, human-readable summary of the problem
          title: "Title",
          # a human-readable explanation specific to this occurrence of the problem
          detail: "Detail of the error",
          # an object containing references to the source of the error
          source: "/data",
          # A meta object containing non-standard meta-information about the error.
          meta: {"internal_error" => {}}
      }
    }
```

This package comes with a default configuration out of the box that handles all the rails default errors.
By default every exception that is not matched in the list is just raised up to the application, in order
to handle not matched errors you need to set the catch_unhandled_exceptions attribute to true. if
catch_unhandled_exceptions is set to true given the following exception:
```ruby
StandardError.new("msg")
```
you get this error response:

```
{
    errors:[
        {
            title: "Unhandled exception",
            detail: "The Exception: StandardError msg. is not handled in configuration.matches.",
            status: "500"
        }
    ]
}
```

Below here you can find a complete example
```ruby
JSONAPIErrors::Configuration.cofigure do |config|
config.matches  = {
      ###
      # ActiveRecord exceptions
      ###
      "ActiveRecord::RecordInvalid" => {
          status: "422",
          code: "422"
      },
      "SubclassNotFound" => {
          status: "422",
          code: "422"
      },
      "AssociationTypeMismatch" => {
          status: "422",
          code: "422"
      },
      "SerializationTypeMismatch" => {
          status: "422",
          code: "422"
      },
      "AdapterNotSpecified" => {
          status: "422",
          code: "422"
      },
      "AdapterNotFound" => {
          status: "422",
          code: "422"
      },
      "ConnectionNotEstablished" => {
          status: "422",
          code: "422"
      },
      "RecordNotFound" => {
          status: "422",
          code: "422"
      },
      "RecordNotSaved" => {
          status: "422",
          code: "422"
      },
      "RecordNotDestroyed" => {
          status: "422",
          code: "422"
      },
      "StatementInvalid" => {
          status: "422",
          code: "422"
      },
      "PreparedStatementInvalid" => {
          status: "422",
          code: "422"
      },
      "StaleObjectError" => {
          status: "422",
          code: "422"
      },
      "ConfigurationError" => {
          status: "422",
          code: "422"
      },
      "ReadOnlyRecord" => {
          status: "422",
          code: "422"
      },
      "Rollback" => {
          status: "422",
          code: "422"
      },
      "DangerousAttributeError" => {
          status: "422",
          code: "422"
      },
      "AttributeAssignmentError" => {
          status: "422",
          code: "422"
      },
      "MultiparameterAssignmentErrors" => {
          status: "422",
          code: "422"
      },
      "UnknownPrimaryKey" => {
          status: "422",
          code: "422"
      },
      "ImmutableRelation" => {
          status: "422",
          code: "422"
      },
      "TransactionIsolationError" => {
          status: "422",
          code: "422"
      }
  }

  # set true in order to  catch not matched exceptions
  config.catch_unhandled_exceptions = false
end
```

Put this file in a rails initializer in order to make it work as expected.


## Code Status

[![Build Status](https://travis-ci.org/intrip/jsonapi_errors.svg?branch=master)](https://github.com/intrip/jsonapi_errors)

## Contributing

1. Fork it ( https://github.com/intrip/JSONAPI_errors/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
