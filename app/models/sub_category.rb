class SubCategory < ActiveRecord::Base
  belongs_to :category

  has_many :product_types
  has_many :parameters, :as => :parameterable

  attr_accessible :description, :name, :category_id

  validates :name,  :presence => true

  def find_rebates
    result = product_types.inject([]) {|r, m| r.concat m.rebates }
    product_types.inject(result) {|r, m| r.concat m.find_rebates }
  end
end
