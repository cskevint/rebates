class ProductType < ActiveRecord::Base
  belongs_to :sub_category

  has_many :rebates, :as => :rebateable
  has_many :parameters, :as => :parameterable

  attr_accessible :description, :name, :sub_category_id

  validates :name,  :presence => true
end
