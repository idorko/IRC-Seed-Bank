class FarmersController < ApplicationController
  # GET /farmers
  # GET /farmers.json
  def index
    @farmers = Farmer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @farmers }
    end
  end

  # GET /farmers/1
  # GET /farmers/1.json
  def show
    @farmer = Farmer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @farmer }
    end
  end

  # GET /farmers/new
  # GET /farmers/new.json
  def new
    @farmer = Farmer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @farmer }
    end
  end

  # GET /farmers/1/edit
  def edit
    @farmer = Farmer.find(params[:id])
  end

  # POST /farmers
  # POST /farmers.json
  def create
    @farmer = Farmer.new(params[:farmer])

    respond_to do |format|
      if @farmer.save
        format.html { redirect_to @farmer, notice: 'Farmer was successfully created.' }
        format.json { render json: @farmer, status: :created, location: @farmer }
      else
        format.html { render action: "new" }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /farmers/1
  # PUT /farmers/1.json
  def update
    @farmer = Farmer.find(params[:id])

    respond_to do |format|
      if @farmer.update_attributes(params[:farmer])
        format.html { redirect_to @farmer, notice: 'Farmer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farmers/1
  # DELETE /farmers/1.json
  def destroy
    @farmer = Farmer.find(params[:id])
    @farmer.destroy

    respond_to do |format|
      format.html { redirect_to farmers_url }
      format.json { head :no_content }
    end
  end
end
