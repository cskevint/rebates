class ProductType < ActiveRecord::Base
  has_many :rebates, :as => :rebateable
  attr_accessible :description, :name

  validates :name,  :presence => true
end
