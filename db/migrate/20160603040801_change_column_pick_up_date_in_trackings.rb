class ChangeColumnPickUpDateInTrackings < ActiveRecord::Migration
  def change
    change_column :trackings, :pick_up_date, :date
  end
end
