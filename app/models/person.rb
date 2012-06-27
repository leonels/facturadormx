class Person < ActiveRecord::Base

  belongs_to :organization
  
  # to-do
  # add email validation
  # validates_presence_of :organization_id
  validates :email, :presence => true, :uniqueness => true

end
