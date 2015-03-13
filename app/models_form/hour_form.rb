class HourForm
	include ActiveModel::Model

	def initialize( user, hour = Hour.new() )
		@hour = hour
		@user = user
		# set the default user if not already done
		if( !@hour.user.present? )
			# @hour.user = @user
		end
		# puts self
		

	end

	def submit(params)
		puts "submit"
	end

	def update(params)
		puts "submit \n\n\n"
		if valid?
			true
		else
			false
		end

		puts params
	end

	# setting the methods back to the starter object.
	def method_missing(name, *arguments)
		if( @hour[name].present? )
			@hour[name]
		end
	end



	validates :project_id, numericality: true
  validates :hourtype_id, numericality: true
  validates :start_time, presence: true
	validates :description, presence: true, length: { maximum: 256, minimum: 5 }

end
