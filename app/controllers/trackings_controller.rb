class TrackingsController < ApplicationController
  #before_action :set_tracking, only: [:show, :edit, :update, :destroy]

  # GET /trackings
  # GET /trackings.json
  def index
    redirect_to root_path
  end

  # GET /trackings/1
  # GET /trackings/1.json
  def show
    redirect_to root_path
  end

  # GET /trackings/new
  def new
    @tracking = Tracking.new
    @title = "Tracking Information | GT Auto Transport"
  end

  # GET /trackings/1/edit
  def edit
    redirect_to root_path
  end

  # POST /trackings
  # POST /trackings.json
  def create
    @tracking = Tracking.new(tracking_params)

    respond_to do |format|
      if verify_recaptcha(model: @tracking) && @tracking.save
        
        flash[:success] = "Your tracking request was successfully sent."
        format.html { redirect_to new_tracking_path }
        format.json { render :show, status: :created, location: @tracking }
      else
        flash[:danger] = "Unable to send tracking request. Please check below for errors and let us know you're a human by checking the captcha box."
        format.html { render :new }
        format.json { render json: @tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trackings/1
  # PATCH/PUT /trackings/1.json
  def update
    respond_to do |format|
      if @tracking.update(tracking_params)
        format.html { redirect_to @tracking, notice: 'Tracking was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracking }
      else
        format.html { render :edit }
        format.json { render json: @tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackings/1
  # DELETE /trackings/1.json
  def destroy
    @tracking.destroy
    respond_to do |format|
      format.html { redirect_to trackings_url, notice: 'Tracking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracking
      @tracking = Tracking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracking_params
      params.require(:tracking).permit(:first_name, :last_name, :phone, :email, :order_number, :pick_up_date, :origin_city, :origin_state, :origin_zip, :destination_city, :destination_state, :destination_zip, :year, :make, :model)
    end
end
