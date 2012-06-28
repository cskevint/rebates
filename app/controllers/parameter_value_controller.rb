class ParameterValueController < ApplicationController

  # POST /products/:id/parameters/:id/parameter_values
  # POST /product_types/:id/parameters/:id/parameter_values
  def create
    #@value = params[:value]
    #Product.find(:product_id).value.create(:valueable_id => params[:parameter_id],
    #                                       :valueable_type => params[:parameter_type],
    #                                       :value => @value)

  end

  # PUT /products/:id/parameters/:id/parameter_values/:id
  # PUT /product_types/:id/parameters/:id/parameter_values/:id
  def update
    #ParameterValue.find(params[:id]).update(:value => @value)
  end

end
