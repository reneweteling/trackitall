class Hour < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :hourtype

  validates :user_id, numericality: true
  validates :project_id, numericality: true
  validates :hourtype_id, numericality: true
  validates :date, presence: true
  validates :duration_human, presence: true
  validates :duration, presence: true, numericality: true
  validate :valid_duration
  validates :description, presence: true, length: { maximum: 256, minimum: 5 }


  def duration_human=(d)

  	write_attribute( :duration_human, d )

  	if( sec = seconds_in(d) )
  		write_attribute( :duration, sec )
  	else
  		write_attribute( :duration, 0 )
  	end
  	
  end

  def valid_duration
  	errors.add(:duration_human, "Wat do you think! This is noncence!!!, try 1h, 1hour whatever" ) if seconds_in( duration_human ) == false
  end

  private 

  def seconds_in(time)
    now = Time.now
    seconds = ChronicDuration.parse( time )
    parsed = Chronic.parse("#{seconds} seconds from now", :now => now) 
    
    if( parsed )
    	parsed - now
    else 
    	false
    end
	end

end
