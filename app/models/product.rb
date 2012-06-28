class Product < ActiveRecord::Base

  belongs_to :product_type

  has_many :rebates, :as => :rebateable
  has_many :parameters, :as => :parameterable

  attr_accessible :description, :name, :product_type_id

  validates :name,  :presence => true
end
