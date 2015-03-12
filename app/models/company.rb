class Company < ActiveRecord::Base
	include Default_name

  belongs_to :address
  has_many :projects
  has_many :hourtypes
  has_many :prices
end
