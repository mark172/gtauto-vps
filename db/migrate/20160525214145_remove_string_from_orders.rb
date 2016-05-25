class RemoveStringFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :string, :string
  end
end
