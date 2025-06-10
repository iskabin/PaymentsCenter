class ChargeableItem < ApplicationRecord
  belongs_to :Product
  belongs_to :chargeable, polymorphic: true
end
