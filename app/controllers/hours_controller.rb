class HoursController < ApplicationController
	
	before_action :set_hour, only: [:show, :edit, :update, :destroy]

	def index
		if signed_in?
			@hours = current_user.hours
			render :index
		else
			render 'sessions/new'
		end
	end

  # GET /hours/new
  def new
    @hour = Hour.new



  end

  # GET /hours/1/edit
  def edit
  	render :new
  end

  # POST /hours
  # POST /hours.json
  def create

  	@hour = Hour.new(hour_params)
  	@hour.user = current_user
	  
	  if @hour.save
      redirect_to hours_path, notice: 'Hour was successfully created.'
    else
  		render :new
    end
  
  end

  # PATCH/PUT /hours/1
  # PATCH/PUT /hours/1.json
  def update
    if @hour.update(hour_params)
      redirect_to hours_path, notice: 'Hour was successfully updated.'
    else
      render :new
    end
  end

  # DELETE /hours/1
  # DELETE /hours/1.json
  def destroy
    @hour.destroy
    respond_to do |format|
      format.html { redirect_to hours_url, notice: 'Hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hour
      @hour = Hour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hour_params
      params.require(:hour).permit(:user_id, :project_id, :hourtype_id, :start_time, :end_time, :description)
    end

end