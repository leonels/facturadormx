class Person < ActiveRecord::Base

  belongs_to :organization
  
  # to-do 1
  # add email validation
  # validates_presence_of :organization_id
  # to-do 2
  # remove phone_two
  validates :email, :presence => true, :uniqueness => true
  
  def full_name
    "#{first_name} " + "#{last_name}"
  end

end
