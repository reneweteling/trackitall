class Component < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :price
end
