class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :document
      #t.enum :document_type, [ :CPF, :CNPJ ], default: :CPF #0:CPF 1:CNPJ
      #t.enum :type, [ :individual, :company ], default: :individual #0:individual 1:company

      t.timestamps
    end
  end
end
