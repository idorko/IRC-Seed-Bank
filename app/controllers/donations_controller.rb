class DonationsController < ApplicationController
  
def options
		#setting final donation parameters before creation
		@seed = Seed.find(params[:seed])
		@donor = Donor.find(params[:donor_id])
		@donation = Donation.new
		@donation.donor = @donor
		@donation.seed = @seed
	end
	
	def list_seeds
		 @seeds = Seed.find_all_by_family(params[:seed_family])
	#list all seeds from family for selection
	   respond_to do |format|
     format.html # list_seeds.html.erb
     format.json { render json: @dispensals }
    end
	end
	
	# GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donations }
    end
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
    @donation = Donation.find(params[:id])
		@donor = @donation.donor
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donation }
    end
  end

  # GET /donations/new
  # GET /donations/new.json
  def new
    @donation = Donation.new
		@donor = Donor.find(params[:donor_id])
		@donation.donor = @donor
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donation }
    end
  end

  # GET /donations/1/edit
  def edit
    @donation = Donation.find(params[:id])
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(params[:donation])
		#set donation quantity
		

		@seed = Seed.find(params[:donation][:seed_id])
		@donation.seed = @seed
    
		respond_to do |format|
      if @donation.save
				#link seed to donation			
				@donation.update_attribute(:quantity, params[:pounds].to_i*16 + params[:ounces].to_i)			
				@donation.seed.update_quantity
        format.html { redirect_to @seed, notice: 'Donation was successfully created.' }
        format.json { render json: @donation, status: :created, location: @donation }
      else
        format.html { render action: "options" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donations/1
  # PUT /donations/1.json
  def update
    @donation = Donation.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @seed = Donation.find(params[:id]).seed
		Donation.destroy(params[:id])
		@seed.update_quantity
    respond_to do |format|
      format.html { redirect_to @seed }
      format.json { head :no_content }
    end
  end
end
