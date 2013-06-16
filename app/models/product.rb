class Product < ActiveRecord::Base
  has_many :line_items
has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item
  attr_accessible :available, :description, :image_url, :price, :title

  validates_presence_of :title, :description, :price

  validates_numericality_of :price

# Lässt sich nicht vereinen mit dem seed
  #validates :image_url, :format => {:with => %r{((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)}i, :message => 'not valid'}

  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

  validates :title, :uniqueness => true

  private
  # ensure that there are no line items referencing this product
def ensure_not_referenced_by_any_line_item
if line_items.empty?
return true
else
errors.add(:base, 'Line Items present')
return false
end
end

end
