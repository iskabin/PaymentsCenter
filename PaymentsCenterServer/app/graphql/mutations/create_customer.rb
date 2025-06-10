module Mutations
  class Mutations::CreateCustomer < Mutations::BaseMutation
    null false
    argument :name, String, required: true
    argument :email, String, required: true
    argument :document, String
    argument :document_type, Types::CustomerDocumentTypeType
    argument :type, Types::CustomerTypeType

    field :customer, Types::CustomerType
    field :errors, [String], null: false

    def resolve(name:, email:, document:, document_type:, type:)
      customer = Customer.build(name: name, email: email, document: document, document_type: document_type, type: type)
      if customer.save
        # Successful creation, return the created object with no errors
        {
          customer: customer,
          errors: [],
        }
      else
        # Failed save, return the errors to the client
        {
          customer: nil,
          errors: customer.errors.full_messages
        }
      end
    end
  end
end