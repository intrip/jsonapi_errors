module JSONAPIErrors
  class Configuration
    cattr_accessor :matches do
      {
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
