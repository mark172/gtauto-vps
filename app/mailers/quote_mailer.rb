class QuoteMailer < ActionMailer::Base
    default to: 'sales@gtautotransport.com'
    def quote_email(first_name, last_name, email, phone, pick_up_date, origin_city, origin_state, origin_zip, destination_city, destination_state, destination_zip, year, make, model, is_operable, description)
        @first_name = first_name
        @last_name = last_name
        @email = email
        @phone = phone
        @pick_up_date = pick_up_date
        @origin_city = origin_city
        @origin_state = origin_state
        @origin_zip = origin_zip
        @destination_city = destination_city
        @destination_state = destination_state
        @destination_zip = destination_zip
        @year = year
        @make = make
        @model = model
        @is_operable = is_operable
        @description = description
        
        mail(from: 'no-reply@qtautomotive.com', subject: 'New Quote Request')
    end
end