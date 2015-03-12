class Project < ActiveRecord::Base
	include Default_name
  belongs_to :company
end
