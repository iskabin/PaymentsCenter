module Types
  class OrderStatusType < BaseEnum
    value "pending", "Pending"
    value "paid", "Paid"
    value "canceled", "Canceled"
    value "failed", "Failed"
  end
end