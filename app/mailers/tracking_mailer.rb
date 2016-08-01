class TrackingMailer < ActionMailer::Base
    default to: 'sales@gtautotransport.com'
    def tracking_email(first_name, last_name, email, phone, pick_up_date, origin_city, origin_state, origin_zip, destination_city, destination_state, destination_zip, year, make, model)
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
        
        mail(from: 'no-reply@qtautomotive.com', subject: 'New Tracking Request')
    end
end