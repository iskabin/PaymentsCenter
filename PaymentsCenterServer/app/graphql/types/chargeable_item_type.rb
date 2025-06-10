# frozen_string_literal: true

module Types
  class ChargeableItemType < Types::BaseObject
    field :id, ID, null: false
    field :value, Integer
    field :chargeable_id, Integer
    field :chargeable_type, String
    field :Product_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :product, Types::ProductType

    def product
      return Product.find(object.Product_id)
    end

  end
end
