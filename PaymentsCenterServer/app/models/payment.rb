class Payment < ApplicationRecord
  belongs_to :payable, polymorphic: true
  enum :status, [ :pending, :paid, :failed ], default: :pending
end
