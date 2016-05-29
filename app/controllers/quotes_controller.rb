class QuotesController < ApplicationController
  #before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    redirect_to root_path
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    redirect_to root_path
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
    @title = "Free Quote | GT Auto Transport"
  end

  # GET /quotes/1/edit
  def edit
    redirect_to root_path
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if verify_recaptcha(model: @quote) && @quote.save

        first_name = params[:quote][:first_name]
        last_name = params[:quote][:last_name]
        phone = params[:quote][:phone]
        email = params[:quote][:email]
        pick_up_date = params[:quote][:pick_up_date]
        origin_city = params[:quote][:origin_city]
        origin_state = params[:quote][:origin_state]
        origin_zip = params[:quote][:origin_zip]
        destination_city = params[:quote][:destination_city]
        destination_state = params[:quote][:destination_state]
        destination_zip = params[:quote][:destination_zip]
        year = params[:quote][:year]
        make = params[:quote][:make]
        model = params[:quote][:model]
        is_operable = params[:quote][:is_operable]
        description = params[:quote][:description]
        
        QuoteMailer.quote_email(first_name, last_name, email, phone, pick_up_date, origin_city, origin_state, origin_zip, destination_city, destination_state, destination_zip, year, make, model, is_operable, description).deliver_now
        
        flash[:success] = "Your quote request was successfully sent."
        format.html { redirect_to new_quote_path }
        format.json { render :show, status: :created, location: @quote }
      else
        flash[:danger] = "Unable to send quote request. Please check below for errors and let us know you're a human by checking the captcha box."
        format.html { render :new}
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    redirect_to root_path
    # respond_to do |format|
    #   if @quote.update(quote_params)
    #     format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @quote }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @quote.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    redirect_to root_path
    # @quote.destroy
    # respond_to do |format|
    #   format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:first_name, :last_name, :email, :phone, :pick_up_date, :origin_city, :origin_state, :origin_zip, :destination_city, :destination_state, :destination_zip, :year, :make, :model, :is_operable, :description)
    end
end
