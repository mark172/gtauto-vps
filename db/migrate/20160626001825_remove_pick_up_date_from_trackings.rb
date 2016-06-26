class RemovePickUpDateFromTrackings < ActiveRecord::Migration
  def change
    remove_column :trackings, :pick_up_date, :date
  end
end
