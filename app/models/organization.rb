class Organization < ActiveRecord::Base
  validates_presence_of :name
  has_many :invoices
end
