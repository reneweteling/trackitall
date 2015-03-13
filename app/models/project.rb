class Project < ActiveRecord::Base
	include DefaultName
  belongs_to :company
end
