class Parameter < ActiveRecord::Base
  belongs_to :parameterable, :polymorphic => true

  attr_accessible :description, :name, :parameterable_id, :parameterable_type

  validates :name,  :presence => true
end
