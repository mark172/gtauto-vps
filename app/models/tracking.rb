class Tracking < ActiveRecord::Base
    validates :first_name, :last_name, :phone, :email, :order_number, :pick_up_date, :origin_city, :origin_state, :origin_zip, :destination_city, :destination_state, :destination_zip, :year, :make, :model, presence: true
end
