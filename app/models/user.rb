class User < ActiveRecord::Base
  belongs_to :address
  belongs_to :invoice_address
  belongs_to :company
end
