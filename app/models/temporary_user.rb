class TemporaryUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable 

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  #validates_attachment :avatar,:content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  # :content_type => { :content_type => "image/jpeg" },
  # :size => { :in => 0..10.kilobytes }
  #validates_attachment_presence :avatar
  #validates_inclusion_of :avatar_file_size, in: 0..4096.megabytes , message: "Photo size should be 4mb only"
  #validates_inclusion_of :avatar_content_type, in: %w( jpg gif png jpeg), message: "image extension support jpg or gif or png or jpeg only"
  #validates_attachment_size :avatar ,:avatar_file_size => { :greater_than => 0..10.kilobytes }
  #validates_attachment_content_type :avatar ,:content_type => ["image/jpeg", "image/gif", "image/png"]

   #validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_attachment :avatar,
    content_type: { content_type: %w(image/jpeg image/png image/gif image/jpg) }

  validates_attachment :avatar,size: {in:  0..4.megabytes}, message: "Photo size should be 4mb only"
  

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
  validates :zipcode, presence: true
  #validate :email_checking

  


  def how_to_know_this
    if self.to_know.blank?
      self.to_know = "None Selected"
      self.save
    end
  end



  

end
