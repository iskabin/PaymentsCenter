module Queries
  class Queries::GetProducts < BaseQuery
    type [Types::ProductType], null: false

    def resolve()
      Product.all
    end
  end
end