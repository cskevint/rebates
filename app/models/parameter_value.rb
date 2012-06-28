class ParameterValue < ActiveRecord::Base

  attr_accessible :value, :parameter_id, :valueable_id, :valueable_type

  belongs_to :valueable, :polymorphic => true

end
