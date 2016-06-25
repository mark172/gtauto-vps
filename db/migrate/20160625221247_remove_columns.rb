class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :orders, :quote_number, :string
    remove_column :orders, :amount_quoted, :string
    remove_column :orders, :origin_home_phone, :string
    remove_column :orders, :origin_work_phone, :string
    remove_column :orders, :destination_home_phone, :string
    remove_column :orders, :destination_work_phone, :string
    remove_column :orders, :license_plate, :string
    remove_column :orders, :vin, :string
    remove_column :orders, :color, :string
    remove_column :orders, :is_oversied, :boolean
    remove_column :orders, :payment, :string
  end
end
