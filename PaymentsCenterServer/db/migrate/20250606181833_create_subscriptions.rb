class CreateSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :Customer, null: false, foreign_key: true
      t.integer :value #centavos
      #t.enum :status, [ :active, :canceled, :future ], default: :future

      t.timestamps
    end
  end
end
