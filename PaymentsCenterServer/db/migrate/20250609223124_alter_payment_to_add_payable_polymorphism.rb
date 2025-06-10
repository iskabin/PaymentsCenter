class AlterPaymentToAddPayablePolymorphism < ActiveRecord::Migration[8.0]
  def change
    change_table :payments do |t|
      t.bigint  :payable_id
      t.string  :payable_type #Order or Subscription

      t.remove :Order_id, :Subscription_id
    end

    add_index :payments, [:payable_type, :payable_id]
  end
end
