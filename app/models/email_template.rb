class EmailTemplate < ActiveRecord::Base
  
  belongs_to :user
  
  validates(:name, { presence: true, uniqueness: true })
  validates(:body, { presence: true })
  validates(:subject, { presence: true })
  
end
