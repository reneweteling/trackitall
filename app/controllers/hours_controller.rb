class HoursController < ApplicationController
	
	before_action :set_hour, only: [:show, :edit, :update, :destroy]
	before_action :require_login

	def index
		if signed_in?

			# get all the users hours, sorted
			@hours = current_user.hours.order(start_time: :desc)

			# hash for the template with all the hours grouped into days
			@days = {}

			@hours.each do |h|
				
				# convert hour into hash, so i can add custom properties
				# this is probably the long way around... 
				@b = {
					id: h.id,
					project: h.project,
					start_time: h.start_time,
					end_time: h.end_time,
					delta: h.end_time ? h.end_time - h.start_time : 0,
					description: h.description
				}

				# init the new hash
				@days[ h.start_time.to_date ] ||= { hours: [], total: 0 }
				# push the hour on the hash
				@days[ h.start_time.to_date ][ :hours ] << @b
				# add tht total time
				@days[ h.start_time.to_date ][ :total ] += @b[:delta]
			end

			render :index
		else
			render 'sessions/new'
		end
	end

	# GET /hours/projects
	def projects 
		puts "\n\n\n\n\n"

		@projects = current_user.projects

		if( params[:id] )
			@projects = @projects.where( "projects.id" => params[:id] ) 
		else
			if( params[:q] )
				@projects = @projects.where( "projects.name LIKE ?", "%#{params[:q]}%" ) 
			end
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