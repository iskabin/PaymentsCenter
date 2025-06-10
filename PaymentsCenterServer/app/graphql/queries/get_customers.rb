module Queries
  class Queries::GetCustomers < BaseQuery
    type [Types::CustomerType], null: false

    def resolve()
      Customer.order(created_at: :desc).all
    end
  end
end