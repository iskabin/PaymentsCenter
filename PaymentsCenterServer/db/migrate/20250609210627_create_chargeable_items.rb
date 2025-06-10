class CreateChargeableItems < ActiveRecord::Migration[8.0]
  def change
    create_table :chargeable_items do |t|
      t.integer :value
      t.bigint  :chargeable_id
      t.string  :chargeable_type #Order or Subscription
      t.belongs_to :Product, null: false, foreign_key: true

      t.timestamps
    end

    add_index :chargeable_items, [:chargeable_type, :chargeable_id]
  end
end
