class SubCategory < ActiveRecord::Base
  belongs_to :category

  has_many :parameters, :as => :parameterable

  attr_accessible :description, :name, :category_id

  validates :name,  :presence => true
end
