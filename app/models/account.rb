class Account < ActiveRecord::Base
  has_many :organizations, :dependent => :destroy
  has_many :people, :dependent => :destroy
  has_many :users, :dependent => :destroy
  accepts_nested_attributes_for :organizations #, :reject_if => proc {|a| a['account_id'].blank?}, :allow_destroy => true
  accepts_nested_attributes_for :people
  accepts_nested_attributes_for :users, allow_destroy: true

  has_many :items, :dependent => :destroy
  has_many :invoices, :dependent => :destroy
  accepts_nested_attributes_for :items
  accepts_nested_attributes_for :invoices
end
