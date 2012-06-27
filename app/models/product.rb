class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :sub_category
  belongs_to :product_type
  has_many :rebates, :as => :rebateable
  attr_accessible :description, :name, :category_id, :sub_category_id, :product_type_id

  validates :name,  :presence => true
end
