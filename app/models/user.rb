class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
  belongs_to :address
  belongs_to :invoice_address, :class_name => "Address", :foreign_key => "invoice_address_id"
  has_many :oauths
  has_many :usercompany
  has_many :companies, through: :usercompany
  has_many :hours
  has_many :projects, through: :companies
  has_many :hourtypes, through: :companies
  has_many :prices, through: :companies


	# validates :address_id, numericality: true
	# validates :invoice_address_id, numericality: true
	# validates :company_id, numericality: true
	validates :first_name, presence: true, length: { maximum: 256, minimum: 2 }
	validates :last_name, presence: true, length: { maximum: 256, minimum: 5 }
	validates :email, confirmation: true
  validates :password, presence: true, if: "oauths.nil?"


  def self.find_or_create_from_auth_hash(auth_hash)
    oauth = Oauth.find_or_initialize_by(uid: auth_hash[:uid], provider: auth_hash[:provider]) do |o|
      o.raw = auth_hash
    end

    unless oauth.user
      oauth.user = User.find_or_create_by!(email: auth_hash[:info][:email]) do |u|
        if auth_hash[:provider] == 'github'
          u.password = Devise.friendly_token.first(8)
          u.email = auth_hash[:info][:email]
          u.first_name = auth_hash[:info][:name]
          u.last_name = auth_hash[:info][:name]
        end
      end
    end

    oauth.token = auth_hash[:credentials][:token]
    oauth.login_at = Time.zone.now
    oauth.save!

    oauth.user
  end

end
