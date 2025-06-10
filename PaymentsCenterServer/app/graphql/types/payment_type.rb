# frozen_string_literal: true

module Types
  class PaymentType < Types::BaseObject
    field :id, ID, null: false
    field :value, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :status, Types::PaymentStatusType
    field :payable_id, Integer
    field :payable_type, String

    field :payable, Types::PayableType

  end
end
