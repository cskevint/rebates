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
    if @rebateable.nil?
      @rebates = Rebate.all
    else
      @rebates = @rebateable.rebates
    end

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rebate }
    end
  end

  # GET /rebates/1/edit
  def edit
    @providers = Provider.all
    @zones = Zone.all
    @rebateable = find_rebateable
    @rebate = Rebate.find(params[:id])
  end

  # POST /rebates
  # POST /rebates.json
  def create
    @rebateable = find_rebateable
    @rebate = @rebateable.rebates.build(params[:rebate])

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
