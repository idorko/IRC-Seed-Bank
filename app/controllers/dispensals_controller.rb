
class DispensalsController < ApplicationController
	before_filter :authenticate_user!
	def options
		#setting final dispensal parameters before creation
		@seed = Seed.find(params[:seed])
		@farmer = Farmer.find(params[:farmer_id])
		@dispensal = Dispensal.new
		@dispensal.farmer = @farmer
		@dispensal.seed = @seed
	end
	
	def list_seeds
		 @seeds = Seed.find_all_by_family(params[:seed_family])
	#list all seeds from family for selection
	   respond_to do |format|
     format.html # list_seeds.html.erb
     format.json { render json: @dispensals }
    end
	end

  # GET /dispensals
  # GET /dispensals.json
  def index

  end

  # GET /dispensals/1
  # GET /dispensals/1.json
  def show
    @dispensal = Dispensal.find(params[:id])
		@farmer = @dispensal.farmer
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dispensal }
    end
  end

  # GET /dispensals/new
  # GET /dispensals/new.json
  def new
    @dispensal = Dispensal.new
		@farmer = Farmer.find(params[:farmer_id])
		@dispensal.farmer = @farmer
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dispensal }
    end
  end

  # GET /dispensals/1/edit
  def edit
    @dispensal = Dispensal.find(params[:id])
  end

  # POST /dispensals
  # POST /dispensals.json
  def create
    @dispensal = Dispensal.new(params[:dispensal])
		@seed = Seed.find(params[:dispensal][:seed_id])
		@dispensal.seed = @seed
		@farmer = @dispensal.farmer
    respond_to do |format|
				@dispensal.update_attribute(:quantity, params[:grams].to_i*0.035274)	
			if @dispensal.quantity > @seed.quantity
			 redirect_to(options_dispensals_path( :seed => params[:dispensal][:seed_id], :farmer_id => @farmer.id), alert: 'Not enough seeds.') and return false
			end
      if @dispensal.save
		
		@dispensal.seed.update_quantity(@dispensal.quantity)
        format.html { redirect_to @farmer, notice: 'Dispensal was successfully created.' }
        format.json { render json: @dispensal, status: :created, location: @dispensal }
      else
        format.html { render action: "options" }	
        format.json { render json: @dispensal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dispensals/1
  # PUT /dispensals/1.json
  def update
    @dispensal = Dispensal.find(params[:id])

    respond_to do |format|
      if @dispensal.update_attributes(params[:dispensal])
        format.html { redirect_to @dispensal, notice: 'Dispensal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dispensal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispensals/1
  # DELETE /dispensals/1.json
  def destroy
    @dispensal = Dispensal.find(params[:id])
    @dispensal.destroy
		@seed = @dispensal.seed
		@seed.update_quantity
    respond_to do |format|
      format.html { redirect_to dispensals_url }
      format.json { head :no_content }
    end
  end
end
