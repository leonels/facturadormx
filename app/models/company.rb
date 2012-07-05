class Company < ActiveRecord::Base
  belongs_to :account
  validates :name, :uniqueness => true
end
