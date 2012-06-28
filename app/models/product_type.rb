class ProductType < ActiveRecord::Base
  belongs_to :sub_category

  has_many :products
  has_many :rebates, :as => :rebateable
  has_many :parameters, :as => :parameterable
  has_many :parameter_values, :as => :valueable

  attr_accessible :description, :name, :sub_category_id

  validates :name,  :presence => true

  def find_rebates
    products.inject([]) {|result, m| result.concat m.rebates }
  end
end
