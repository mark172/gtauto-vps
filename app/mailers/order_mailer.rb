class OrderMailer < ActionMailer::Base
    default to: 'mark172@me.com'
    def order_email(todays_date, date_first_available, quote_number, amount_quoted, phone, email, origin_first_name, origin_last_name, origin_city, origin_state, origin_zip, origin_home_phone, origin_work_phone, origin_cell_phone, destination_first_name, destination_last_name, destination_city, destination_state, destination_zip, destination_home_phone, destination_work_phone, destination_cell_phone, year, make, model, license_plate, vin, color, is_operable, is_oversied, payment, description)
        @todays_date = todays_date
        @date_first_available = date_first_available
        @quote_number = quote_number
        @amount_quoted = amount_quoted
        @phone = phone
        @email = email
        @origin_first_name = origin_first_name
        @origin_last_name = origin_last_name
        @origin_city = origin_city
        @origin_state = origin_state
        @origin_zip = origin_zip
        @origin_home_phone = origin_home_phone
        @origin_work_phone = origin_work_phone
        @origin_cell_phone = origin_cell_phone
        @destination_first_name = destination_first_name
        @destination_last_name = destination_last_name
        @destination_city = destination_city
        @destination_state = destination_state
        @destination_zip = destination_zip
        @destination_home_phone = destination_home_phone
        @destination_work_phone = destination_work_phone
        @destination_cell_phone = destination_cell_phone
        @year = year
        @make = make
        @model = model
        @license_plate = license_plate
        @vin = vin
        @color = color
        @is_operable = is_operable
        @is_oversied = is_oversied
        @payment = payment
        @description = description
        
        mail(from: 'no-reply@qtautomotive.com', subject: 'NEW ORDER')
    end
end