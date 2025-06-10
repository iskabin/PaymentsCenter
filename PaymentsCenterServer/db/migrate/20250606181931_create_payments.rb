class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.belongs_to :Order, null: true, foreign_key: true
      t.belongs_to :Subscription, null: true, foreign_key: true
      t.integer :value #centavos
      #t.enum :status, [ :pending, :confirmed, :failed ], default: :pending

      t.timestamps
    end
  end
end
