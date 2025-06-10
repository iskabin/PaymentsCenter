module Types
  class PayableType < Types::BaseUnion
    description "Objects that can be payed"
    possible_types Types::OrderType, Types::SubscriptionType

    # Optional: if this method is defined, it will override `Schema.resolve_type`
    def self.resolve_type(object, context)
      if object.is_a?(Order)
        Types::OrderType
      else
        Types::SubscriptionType
      end
    end
  end
end