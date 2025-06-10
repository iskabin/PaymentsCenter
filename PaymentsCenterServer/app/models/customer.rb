class Customer < ApplicationRecord
  self.inheritance_column = :_type_disabled #fix to use 'type' as a column name as I don't intend to use single-table inheritance in this table
  has_many :orders
  has_many :subscriptions
  enum :type, [ :individual, :company ], default: :individual
  enum :document_type, [ :cpf, :cnpj ], default: :cpf
end
