class AddIndexAndValidationToOrder < ActiveRecord::Migration[7.1]
  def up
    change_column :orders, :customer_email, :string, null: false
    change_column :orders, :status, :integer, default: 0, null: false
    change_column :orders, :total,  :float, default: 0.0, null: false
    change_column :orders, :address, :string, null: false

    Order.reset_column_information
  end

  def down
    change_column :orders, :customer_email, :string
    change_column :orders, :status, :integer
    change_column :orders, :total,  :float
    change_column :orders, :address, :string

    Order.reset_column_information
  end
end
