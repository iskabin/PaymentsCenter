class AddTypeToCustomer < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :type, :integer, default: 0
  end
end
