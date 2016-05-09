class ChangeColumnPickUpDateInQuote < ActiveRecord::Migration
  def change
    change_column :quotes, :pick_up_date, :date
  end
end
