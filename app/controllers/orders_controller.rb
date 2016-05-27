class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.todays_date = Date.current
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if verify_recaptcha(model: @order) && @order.save
        
        todays_date = params[:order][:todays_date]
        date_first_available = params[:order][:date_first_available]
        quote_number = params[:order][:quote_number]
        amount_quoted = params[:order][:amount_quoted]
        phone = params[:order][:phone]
        email = params[:order][:email]
        origin_first_name = params[:order][:origin_first_name]
        origin_last_name = params[:order][:origin_last_name]
        origin_city = params[:order][:origin_city]
        origin_state = params[:order][:origin_state]
        origin_zip = params[:order][:origin_zip]
        origin_home_phone = params[:order][:origin_home_phone]
        origin_work_phone = params[:order][:origin_work_phone]
        origin_cell_phone = params[:order][:origin_cell_phone]
        destination_first_name = params[:order][:destination_first_name]
        destination_last_name = params[:order][:destination_last_name]
        destination_city = params[:order][:destination_city]
        destination_state = params[:order][:destination_state]
        destination_zip = params[:order][:destination_zip]
        destination_home_phone = params[:order][:destination_home_phone]
        destination_work_phone = params[:order][:destination_work_phone]
        destination_cell_phone = params[:order][:destination_cell_phone]
        year = params[:order][:year]
        make = params[:order][:make]
        model = params[:order][:model]
        license_plate = params[:order][:license_plate]
        vin = params[:order][:vin]
        color = params[:order][:color]
        is_operable = params[:order][:is_operable]
        is_oversied = params[:order][:is_oversied]
        payment = params[:order][:payment]
        description = params[:order][:description]
        
        OrderMailer.order_email(todays_date, date_first_available, quote_number, amount_quoted, phone, email, origin_first_name, origin_last_name, origin_city, origin_state, origin_zip, origin_home_phone, origin_work_phone, origin_cell_phone, destination_first_name, destination_last_name, destination_city, destination_state, destination_zip, destination_home_phone, destination_work_phone, destination_cell_phone, year, make, model, license_plate, vin, color, is_operable, is_oversied, payment, description).deliver_now
        
        flash[:success] = "Your order was successfully sent."
        format.html { redirect_to new_order_path }
        format.json { render :show, status: :created, location: @order }
      else
        flash[:danger] = "Unable to send message. Let us know you're a human by checking the captcha box."
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:todays_date, :date_first_available, :quote_number, :amount_quoted, :phone, :email, :origin_first_name, :origin_last_name, :origin_city, :origin_state, :origin_zip, :origin_home_phone, :origin_work_phone, :origin_cell_phone, :destination_first_name, :destination_last_name, :destination_city, :destination_state, :destination_zip, :destination_home_phone, :destination_work_phone, :destination_cell_phone, :year, :make, :model, :license_plate, :vin, :color, :is_operable, :is_oversied, :payment, :description)
    end
end
