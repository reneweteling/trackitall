class Hour < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :hourtype

  validates :project_id, numericality: true
  validates :hourtype_id, numericality: true
  validates :start_time, presence: true
	validates :description, presence: true, length: { maximum: 256, minimum: 5 }
end
