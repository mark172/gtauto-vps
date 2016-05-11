class QuoteMailer < ActionMailer :: Base
    default to: 'mark@sharkwebdev.com'
    def quote_mailer(first_name, last_name, email, phone, pick_up_date, origin_city, origin_state, origin_zip, destination_city, destination_state, destination_zip, year, make, model, is_operable, description)
    end
end