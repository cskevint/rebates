class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :sub_category
  belongs_to :product_type
  attr_accessible :description, :name
end
