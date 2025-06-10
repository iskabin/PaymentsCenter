class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.belongs_to :Customer, null: false, foreign_key: true
      t.integer :value #centavos
      #t.enum :status, [ :pending, :confirmed, :failed, :canceled ], default: :pending

      t.timestamps
    end
  end
end
