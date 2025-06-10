# frozen_string_literal: true

module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :document, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :document_type, Types::CustomerDocumentTypeType
    field :type, Types::CustomerTypeType
  end
end
