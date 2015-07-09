class TemporaryUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



  DETAILS = ["google","yahoo","bing","twiiter","news archive","email","friend","web","advertisement","seminar/conference","city, county or state"]
 


 #validations

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :position, presence: true
  # validates :company_name, presence: true
  # #validates :website, presence: true
  # validates :address1, presence: true
  #validates :zipcode, presence: true





end
