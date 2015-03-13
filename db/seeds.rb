# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create!(email: 'rene@weteling.com', password: 'test1234', password_confirmation: 'test1234')
# User.create!(email: 'emilebosch@me.com', password: 'test1234', password_confirmation: 'test1234')

require 'active_record/fixtures'

@dir = Rails.root.join('test', 'fixtures')
@fixtures = Dir[ @dir.to_s + '/*.yml' ]

@fixtures.map { |a| 
	a.sub! @dir.to_s + '/', ''
	a.sub! '.yml', ''
}

@fixtures = @fixtures.sort

ActiveRecord::Base.connection.transaction do
	# dis-enable foreign key checks
	@fixtures.each do |t| 
		ActiveRecord::Base.connection.execute "ALTER TABLE #{t} disable trigger all;"
	end
	# import fixtures
	ActiveRecord::FixtureSet.create_fixtures(@dir, @fixtures)
	# re-enable foreign key checks
	@fixtures.each do |t| 
		ActiveRecord::Base.connection.execute "ALTER TABLE #{t} enable trigger all;"
	end
end


