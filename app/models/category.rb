class Category < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :parameters, :as => :parameterable

  validates :name,  :presence => true
end
