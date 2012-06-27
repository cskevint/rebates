class Provider < ActiveRecord::Base
  attr_accessible :name, :ptype

  validates :name,  :presence => true
end
