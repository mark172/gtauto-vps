class OrdersController < ApplicationController
  #before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    redirect_to root_path
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    redirect_to root_path
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.todays_date = Date.current
    @title = "Place an Order | GT Auto Transport"
  end

  # GET /orders/1/edit
  def edit
    redirect_to root_path
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if verify_recaptcha(model: @order) && @order.save
        
        todays_date = params[:order][:todays_date]
        date_first_available = params[:order][:date_first_available]
        phone = params[:order][:phone]
        email = params[:order][:email]
        origin_first_name = params[:order][:origin_first_name]
        origin_last_name = params[:order][:origin_last_name]
        origin_street = params[:order][:origin_street]
        origin_city = params[:order][:origin_city]
        origin_state = params[:order][:origin_state]
        origin_zip = params[:order][:origin_zip]
        origin_cell_phone = params[:order][:origin_cell_phone]
        destination_first_name = params[:order][:destination_first_name]
        destination_last_name = params[:order][:destination_last_name]
        destination_street = params[:order][:destination_street]
        destination_city = params[:order][:destination_city]
        destination_state = params[:order][:destination_state]
        destination_zip = params[:order][:destination_zip]
        destination_cell_phone = params[:order][:destination_cell_phone]
        year = params[:order][:year]
        make = params[:order][:make]
        model = params[:order][:model]
        is_operable = params[:order][:is_operable]
        description = params[:order][:description]
        
        OrderMailer.order_email(todays_date, date_first_available, phone, email, origin_first_name, origin_last_name, origin_street, origin_city, origin_state, origin_zip, origin_cell_phone, destination_first_name, destination_last_name, destination_street, destination_city, destination_state, destination_zip, destination_cell_phone, year, make, model, is_operable, description).deliver_now
        
        flash[:success] = "Your order request was successfully sent."
        format.html { redirect_to new_order_path }
        format.json { render :show, status: :created, location: @order }
      else
        flash[:danger] = "Unable to send order request. Please check below for errors and let us know you're a human by checking the captcha box."
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
      params.require(:order).permit(:todays_date, :date_first_available, :phone, :email, :origin_first_name, :origin_last_name, :origin_street, :origin_city, :origin_state, :origin_zip, :origin_cell_phone, :destination_first_name, :destination_last_name, :destination_street, :destination_city, :destination_state, :destination_zip, :destination_cell_phone, :year, :make, :model, :is_operable, :description)
    end
end
