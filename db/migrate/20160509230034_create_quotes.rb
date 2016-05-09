class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.datetime :pick_up_date
      t.string :origin_city
      t.string :origin_state
      t.string :origin_zip
      t.string :destination_city
      t.string :destination_state
      t.string :destination_zip
      t.string :year
      t.string :make
      t.string :model
      t.boolean :is_operable
      t.text :description

      t.timestamps null: false
    end
  end
end
