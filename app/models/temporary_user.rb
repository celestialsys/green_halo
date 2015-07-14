class TemporaryUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable 

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  validates_attachment :image,
    content_type: { content_type: %w(image/jpeg image/png image/gif image/jpg) } ,size: {in:  0..4.megabytes}

  #validates_attachment :image
  

  DETAILS = ["None Selected","google","yahoo","bing","twitter","news archive","email","friend","web","advertisement","seminar/conference","city, county or state"]
 
 #callbacks

  before_save :how_to_know_this

 #validations
   #validates :email, uniqueness: true
  validates_format_of :password, with: /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :position, presence: true
  validates :company_name, presence: true
  validates :website, presence: true
  validates :address1, presence: true
  validates :zipcode, numericality: true 
  validates :phone, numericality: true

  
  

  #callback methods

  def how_to_know_this
    if self.domine_name.blank?
      self.domine_name = "None Selected"
      self.save
    end
  end


  



  

end
