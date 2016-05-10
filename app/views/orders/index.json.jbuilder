json.array!(@orders) do |order|
  json.extract! order, :id, :todays_date, :date_first_available, :quote_number, :amount_quoted, :phone, :email, :origin_first_name, :origin_last_name, :origin_city, :origin_state, :origin_zip, :origin_home_phone, :origin_work_phone, :origin_cell_phone, :destination_first_name, :string, :destination_last_name, :destination_city, :destination_state, :destination_zip, :destination_home_phone, :destination_work_phone, :destination_cell_phone, :year, :make, :model, :license_plate, :vin, :color, :is_operable, :is_oversied, :payment, :description
  json.url order_url(order, format: :json)
end
