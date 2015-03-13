class User < ActiveRecord::Base
	include Clearance::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  belongs_to :address
  belongs_to :invoice_address, :class_name => "Address", :foreign_key => "invoice_address_id"
  has_many :usercompany
  has_many :companies, through: :usercompany
  has_many :hours
  has_many :projects, through: :companies
  has_many :hourtypes, through: :companies
  has_many :prices, through: :companies


	# validates :address_id, numericality: true
	# validates :invoice_address_id, numericality: true
	# validates :company_id, numericality: true
	validates :name, presence: true, length: { maximum: 256, minimum: 5 }
	validates :firstname, presence: true, length: { maximum: 256, minimum: 2 }
	validates :lastname, presence: true, length: { maximum: 256, minimum: 5 }
	validates :email, confirmation: true

end
