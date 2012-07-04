class ParameterValueController < ApplicationController

  # POST /products/:id/parameters/:id/parameter_values
  # POST /product_types/:id/parameters/:id/parameter_values
  def create
    values = []
    params.each do |p|
      if (p[0].include? "parameter_") && (p[1] != "")
        values.push({:parameter_id => p[0].gsub("parameter_","").to_i,
                      :value => p[1],
                      :valueable_id => params[:product_id],
                      :valueable_type => "Product"
                     })
      end
    end
    logger.info values

    existing = Product.find(params[:product_id]).parameter_values

    values.each do |v|
      create = true
      existing.each do |e|
        logger.info v
        if e[:parameter_id] == v[:parameter_id]
          e[:value] = v[:value]
          e.save
          create = false
        end
      end
      if create
        ParameterValue.create(v)
      end
    end

    redirect_to Product.find(params[:product_id]), notice: 'Product was successfully updated.'
  end

  # PUT /products/:id/parameters/:id/parameter_values/:id
  # PUT /product_types/:id/parameters/:id/parameter_values/:id
  def update
    #ParameterValue.find(params[:id]).update(:value => @value)
  end

end
