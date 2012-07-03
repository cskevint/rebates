class RebatesController < ApplicationController

  def find_rebateable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  # GET /rebates
  # GET /rebates.json
  def index
    @rebateable = find_rebateable

    if params[:category_id]
      @rebates = Category.find(params[:category_id]).find_rebates
    elsif params[:sub_category_id]
      @rebates = SubCategory.find(params[:sub_category_id]).find_rebates
    elsif params[:product_type_id]
      @rebates = ProductType.find(params[:product_type_id]).find_rebates
    elsif @rebateable
      @rebates = @rebateable.rebates
    else
      @rebates = Rebate.order(:name).all
    end

    @total = @rebates.count

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rebates }
    end
  end

  # GET /rebates/1
  # GET /rebates/1.json
  def show
    @rebate = Rebate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rebate }
    end
  end

  # GET /rebates/new
  # GET /rebates/new.json
  def new
    @providers = Provider.all
    @zones = Zone.all
    @rebateable = find_rebateable
    @rebate = Rebate.new
    if @rebateable.respond_to?(:product_type)
      @rebate.name = @rebateable.product_type.sub_category.name+" Rebate"
      @rebateable_type = "Product"
    else
      @rebate.name = @rebateable.sub_category.name+" Rebate"
      @rebateable_type = "ProductType"
    end
    @sectors = Tag.find(1,2)
    @industries = Tag.where("id >= 3")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rebate }
    end
  end

  # GET /rebates/1/edit
  def edit
    @providers = Provider.all
    @zones = Zone.all
    @rebate = Rebate.find(params[:id])
    @rebateable = @rebate.rebateable
    @rebateable_type = @rebate.rebateable_type
    @sectors = Tag.find(1,2)
    @industries = Tag.where("id >= 3")
  end

  # POST /rebates
  # POST /rebates.json
  def create
    @rebateable = find_rebateable
    @rebate = @rebateable.rebates.build(params[:rebate])
    @rebate.tag_names = params[:sector_names] + "," + params[:industry_names]

    respond_to do |format|
      if @rebate.save
        format.html { redirect_to :id => nil }
        format.json { render json: @rebate, status: :created, location: @rebate }
      else
        format.html { render action: "new" }
        format.json { render json: @rebate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rebates/1
  # PUT /rebates/1.json
  def update
    @rebate = Rebate.find(params[:id])
    @rebate.tag_names = params[:sector_names] + "," + params[:industry_names]

    respond_to do |format|
      if @rebate.update_attributes(params[:rebate])
        format.html { redirect_to @rebate, notice: 'Rebate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rebate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rebates/1
  # DELETE /rebates/1.json
  def destroy
    @rebate = Rebate.find(params[:id])
    @rebate.destroy

    respond_to do |format|
      format.html { redirect_to rebates_url }
      format.json { head :no_content }
    end
  end
end
