class Quote < ActiveRecord::Base
    validates :first_name, :last_name, :email, :phone, :origin_city, :origin_state, :origin_zip, :destination_city, :destination_state, :destination_zip, :year, :make, :model, :is_operable,  presence: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :phone, numericality: true
end
