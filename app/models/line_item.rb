class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  
  # has_and_belongs_to_many :taxes, :class_name => 'Tax'
  
  before_save :default_values

  validates_presence_of :invoice_id, :on => :update
  validates_presence_of :item_id
  validates :price, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

  def line_total
    price * quantity
  end
  
  def default_values
    self.quantity = 1 unless self.quantity
    self.price = item.price unless self.price
  end
end
