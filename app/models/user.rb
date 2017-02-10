class User < ActiveRecord::Base
  
  has_many :email_templates
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates(:email,{ presence: true, uniqueness: true})
  validates(:name,{ presence: true, uniqueness: true })
  validates( :password,{ presence: true,length: { minimum: 8 }, :on => :create })

end
