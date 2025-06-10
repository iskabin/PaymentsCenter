class Subscription < ApplicationRecord
  belongs_to :Customer
  has_many :chargeable_items, as: :chargeable
  has_many :payments, as: :payable
  enum :status, [ :active, :canceled, :future ], default: :active
end
