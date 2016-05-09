json.array!(@quotes) do |quote|
  json.extract! quote, :id, :first_name, :last_name, :email, :phone, :pick_up_date, :origin_city, :origin_state, :origin_zip, :destination_city, :destination_state, :destination_zip, :year, :make, :model, :is_operable, :description
  json.url quote_url(quote, format: :json)
end
