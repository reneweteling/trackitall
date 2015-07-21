require 'active_support/concern'

module DefaultName
  extend ActiveSupport::Concern
  
  included do

		def to_s()
			self.try(:company) ? "#{self.name} (#{self.company.name})" : self.name
		end

  end
end
