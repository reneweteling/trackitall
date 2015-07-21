require 'test_helper'

class HourTest < ActiveSupport::TestCase
  
  test "Saving with variable parameters" do

  	assert save_with, "Valid input"

  	[:project_id, :user_id, :hourtype_id].each { |p|
			assert_not save_with( { "#{p}" => 'asdc' } ), "Non numieric #{p}"
			assert_not save_with( { "#{p}" => nil } ), "Omitted #{p}"
  	}

	end


	private
		def save_with( params = {} )

			user = User.first
			project = Project.first
			hourtype = Hourtype.first

			valid = {
				user_id: user.id,
				project_id: project.id,
				hourtype_id: hourtype.id,
				start_time: DateTime.now - (5/24.0),
				end_time: DateTime.now - (2/24.0),
				description: 'Blaaa blaa bla'
			}.merge( params )

			return Hour.create( valid ).valid?

		end
end