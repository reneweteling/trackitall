require 'active_support/concern'

module DefaultName
  extend ActiveSupport::Concern
  
  included do

		def to_s()
			self.try(:company) ? "#{self.company.name} - #{self.name}" : self.name
		end

  end
end
