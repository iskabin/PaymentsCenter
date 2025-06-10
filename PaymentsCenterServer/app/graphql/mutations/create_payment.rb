module Mutations
  class Mutations::CreatePayment < Mutations::BaseMutation
    null false
    #argument :customer_id, ID, required: true
    argument :order_id, ID
    argument :subscription_id, ID
    argument :value, Integer, required: true
    argument :status, Types::PaymentStatusType

    field :payment, Types::PaymentType
    field :errors, [String], null: false

    def resolve(order_id:, subscription_id:, value:, status:)

      #Check if an order or a subscription was provided
      if(!order_id && !subscription_id || order_id && subscription_id)
        {
          raise GraphQL::ExecutionError.new("A payment requires either an order or a subscription id!")
        }
      end

      #Check if the provided order or subscription is valid
      if(!Order.where(id: order_id) && !Subscription.where(id: subscription_id))
        {
          raise GraphQL::ExecutionError.new("Provided order or subscription does not exist!")
        }
      end

      payment = Payment.build(Order_id: order_id, Subscription_id: subscription_id, value: value, status: status)
      
      if customer.save
        # Successful creation, return the created object with no errors
        {
          payment: payment,
          errors: [],
        }
      else
        # Failed save, return the errors to the client
        {
          payment: nil,
          errors: payment.errors.full_messages
        }
      end
    end
  end
end