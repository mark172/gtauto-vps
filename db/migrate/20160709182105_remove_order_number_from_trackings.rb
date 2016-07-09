class RemoveOrderNumberFromTrackings < ActiveRecord::Migration
  def change
    remove_column :trackings, :order_number, :string
  end
end
