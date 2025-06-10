module Types
  class PaymentStatusType < BaseEnum
    value "pending", "Pending"
    value "paid", "Paid"
    value "failed", "Failed"
  end
end