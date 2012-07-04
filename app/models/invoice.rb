class Invoice < ActiveRecord::Base

  belongs_to :account
  validates :account_id, :presence => true

  belongs_to :organization
  has_many :line_items, :dependent => :destroy

  validates_presence_of :organization_id, :invoice_number, :issued_on, :status
  # validates_uniqueness_of :invoice_number
  
  scope :newest, :order => "issued_on desc"

  accepts_nested_attributes_for :line_items, :reject_if => :reject_line_items, :allow_destroy => true
  def reject_line_items(attributed)
    attributed['item_id'].blank?
  end

  after_initialize :default_values
  def default_values
    self.status = 'sent' unless self.status
  end
  
  def subtotal
    line_items.to_a.sum { |item| item.line_total }
  end

  def iva
    (self.subtotal * 0.16).round(2)
  end
  
  def total
    (self.subtotal + self.iva).round(2)
  end

  def read_date_created_at
    created_at.strftime("%B %d, %Y")
  end

  def read_date_issued_on
    issued_on.strftime("%B %d, %Y")
  end
  
  def abbreviated_created_at
		created_at.strftime("%a %b %d at %I:%M%P")
	end
  
  def min_created_at
		created_at.strftime("%D")
	end
  
  def min_issued_on
		issued_on.strftime("%D")
	end

end
