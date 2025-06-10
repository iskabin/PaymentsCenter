module Queries
  class Queries::GetSubscriptions < BaseQuery
    type [Types::SubscriptionType], null: false

    def resolve()
      Subscription.order(created_at: :desc).all
    end
  end
end