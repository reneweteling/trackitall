class HoursController < ApplicationController
	
	before_action :set_hour, only: [:show, :edit, :update, :destroy]
	

	def index
		if signed_in?

			# get all the users hours, sorted
			@hours = current_user.hours.order(date: :desc).order(id: :desc)

			# hash for the template with all the hours grouped into days
			@days = {}

			@hours.each do |h|
				
				# convert hour into hash, so i can add custom properties
				# this is probably the long way around... 
				@b = {
					id: h.id,
					project: h.project,
					date: h.date,
					duration: h.duration ? h.duration : 0,
					description: h.description
				}

				# init the new hash
				@days[ h.date.to_date ] ||= { hours: [], total: 0 }
				# push the hour on the hash
				@days[ h.date.to_date ][ :hours ] << @b
				# add tht total time
				@days[ h.date.to_date ][ :total ] += @b[:duration]
			end

      if( !@hour )
        @hour = Hour.new
        @hour.date = Time.zone.today
      end

			render :index

		else
			render 'sessions/new'
		end
	end

	# GET /hours/projects, for the select2
	def projects 
		
		@projects = current_user.projects

		if( params[:id] )
			@projects = @projects.joins(:company).where( "projects.id" => params[:id] ) 
		else
			if( params[:q] )
				@projects = @projects.joins(:company).where( "projects.name ILIKE ? or companies.name ILIKE ?", "%#{params[:q]}%", "%#{params[:q]}%" ) 
			end
		end

	end

  def edit
  	index
  end

  def create
  	@hour = Hour.new(hour_params)
  	@hour.user = User.find_by_id( current_user.id )

    if @hour.save
      @redirect = root_url
    end
    
    render partial: 'form'
  end

  def update
    if @hour.update(hour_params)
      @redirect = root_url
    end
    render partial: 'form'
  end

  def destroy
    @hour.destroy
    redirect_to hours_url, notice: 'Hour was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hour
      @hour = Hour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hour_params
      params.require(:hour).permit(:user_id, :project_id, :hourtype_id, :date, :duration_human, :description)
    end


end