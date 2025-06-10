class Order < ApplicationRecord
  belongs_to :Customer
  has_many :chargeable_items, as: :chargeable
  has_many :payments, as: :payable
  enum :status, [ :pending, :paid, :canceled, :failed ], default: :pending
end
