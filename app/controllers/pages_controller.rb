class PagesController < ApplicationController
  def index
    @title = "We Ship Cars, Trucks, Boats & Motorcycles | GT Auto Transport"
  end
  
  def about
    
  end
  
  def download_pdf
    send_file(
      "#{Rails.root}/public/t_and_c.pdf",
      filename: "terms_and_conditions.pdf",
      type: "application/pdf"
    )
  end
  
  def terms_and_conditions
    
  end
end
