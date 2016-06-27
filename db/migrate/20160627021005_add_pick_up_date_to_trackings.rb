class AddPickUpDateToTrackings < ActiveRecord::Migration
  def change
    add_column :trackings, :pick_up_date, :date
  end
end
