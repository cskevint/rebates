class SubCategory < ActiveRecord::Base
  belongs_to :category
  attr_accessible :description, :name, :category_id

  validates :name,  :presence => true
end
