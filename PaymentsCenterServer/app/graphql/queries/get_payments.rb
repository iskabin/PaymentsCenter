module Queries
  class Queries::GetPayments < BaseQuery
    type [Types::PaymentType], null: false

    argument :product, String, required: false
    argument :status, String, required: false
    argument :tipo, String, required: false

    def resolve(product: nil, status: nil, tipo: nil)
      payments = Payment.all
      payments = payments.where(payable_type: tipo) if tipo.present?
      payments = payments.where(status: status) if status.present?

      payments
    end
  end
end