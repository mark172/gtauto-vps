class Order < ActiveRecord::Base
    validates :date_first_available, :quote_number, :amount_quoted, :phone, :email, :origin_first_name, :origin_last_name, :origin_city, :origin_state, :origin_zip, :origin_home_phone, :origin_work_phone, :origin_cell_phone, :destination_first_name, :destination_last_name, :destination_city, :destination_state, :destination_zip, :destination_home_phone, :destination_work_phone, :destination_cell_phone, :year, :make, :model, :license_plate, :vin, :color, :payment, presence: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "not a valid email address", on: :create }
    validates :phone, :origin_home_phone, :origin_work_phone, :origin_cell_phone, :destination_home_phone, :destination_work_phone, :destination_cell_phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "not a valid phone number. Format as XXX-XXX-XXXX" }
end
