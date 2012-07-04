class Organization < ActiveRecord::Base

  belongs_to :account
  validates :account_id, :presence => true, :on => :update

  has_many :invoices, :dependent => :destroy
  has_many :people, :dependent => :destroy
  accepts_nested_attributes_for :people
  
  validates_presence_of :name
  
  def formatted_address_only
    a = "#{name} <br />" unless name.blank?
    a = "#{a} #{address_one} <br />" unless address_one.blank?
    a = "#{a} #{address_two} <br />" unless address_two.blank?
    a = "#{a} #{city} " unless self.city.blank?
    a = "#{a} #{state} <br />" unless state.blank?
    a = "#{a} #{postal_code} <br />" unless postal_code.blank?
    a.force_encoding('utf-8')
  end
  
  def formatted
    a = "#{name} <br />" unless name.blank?
    a = "#{a} #{address_one} <br />" unless address_one.blank?
    a = "#{a} #{address_two} <br />" unless address_two.blank?
    a = "#{a} #{city} " unless self.city.blank?
    a = "#{a} #{state} " unless state.blank?
    a = "#{a} #{postal_code} <br />" unless postal_code.blank?
    a = "#{a} Phone: #{phone} <br />" unless phone.blank?
    a = "#{a} Fax: #{fax} <br />" unless fax.blank?
    a = "#{a} #{website} <br />" unless website.blank?
    a = "#{a} RFC: #{rfc}" unless rfc.blank?
    a.force_encoding('utf-8')
  end
end
