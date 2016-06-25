class AddStreetAddressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :origin_street, :string
    add_column :orders, :destination_street, :string
  end
end
