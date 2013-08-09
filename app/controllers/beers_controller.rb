class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end
  def new
    @beer_form = BeerForm.new
  end
  # POST /beers
  # POST /beers.json
  def create
    @beer_form = BeerForm.new
    @beer_form.submit(params[:beer_form])
    # respond_to do |format|
    #   if @beer.save
    #     format.html { redirect_to beers_path, notice: 'Beer was successfully created.' }
    #     format.json { render json: @beer, status: :created, location: @beer }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @beer.errors, status: :unprocessable_entity }
    #   end
    # end
  end

end
