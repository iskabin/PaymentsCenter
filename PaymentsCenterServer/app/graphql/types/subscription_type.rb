# frozen_string_literal: true

module Types
  class SubscriptionType < Types::BaseObject
    field :id, ID, null: false
    field :Customer_id, Integer, null: false
    field :value, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :status, Types::SubscriptionStatusType

    field :customer, Types::CustomerType
    field :items, [Types::ChargeableItemType]

    def customer
      return Customer.find(object.Customer_id)
    end

    def items
      return ChargeableItem.where(chargeable_id: object.id , chargeable_type: "Order")
    end
  end
end
