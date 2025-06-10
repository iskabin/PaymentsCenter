module Queries
  class Queries::GetOrders < BaseQuery
    type [Types::OrderType], null: false

    def resolve()
      Order.order(created_at: :desc).all
    end
  end
end