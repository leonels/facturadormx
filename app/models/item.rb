class Item < ActiveRecord::Base
  
  belongs_to :account
  validates :account_id, :presence => true
  
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates_presence_of :name, :price
  validates :name, :uniqueness => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
