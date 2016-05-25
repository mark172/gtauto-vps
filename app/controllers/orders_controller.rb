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
        format.html { redirect_to new_order_path, notice: 'Your order was sucessfully submitted.' }
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
