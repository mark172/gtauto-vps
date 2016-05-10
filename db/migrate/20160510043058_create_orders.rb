class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :todays_date
      t.date :date_first_available
      t.string :quote_number
      t.string :amount_quoted
      t.string :phone
      t.string :email
      t.string :origin_first_name
      t.string :origin_last_name
      t.string :origin_city
      t.string :origin_state
      t.string :origin_zip
      t.string :origin_home_phone
      t.string :origin_work_phone
      t.string :origin_cell_phone
      t.string :destination_first_name
      t.string :string
      t.string :destination_last_name
      t.string :destination_city
      t.string :destination_state
      t.string :destination_zip
      t.string :destination_home_phone
      t.string :destination_work_phone
      t.string :destination_cell_phone
      t.string :year
      t.string :make
      t.string :model
      t.string :license_plate
      t.string :vin
      t.string :color
      t.boolean :is_operable
      t.boolean :is_oversied
      t.string :payment
      t.text :description

      t.timestamps null: false
    end
  end
end
