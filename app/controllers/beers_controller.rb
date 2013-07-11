class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end
  def new
    @beer = Beer.new
  end
  # POST /beers
  # POST /beers.json
  def create
    @beer = Beer.new(beer_params)
    respond_to do |format|
      if @beer.save
        format.html { redirect_to beers_path, notice: 'Beer was successfully created.' }
        format.json { render json: @beer, status: :created, location: @beer }
      else
        format.html { render action: "new" }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

private

  # Use this method to whitelist the permissible parameters. Example:
  # params.require(:person).permit(:name, :age)
  # Also, you can specialize this method with per-user checking of permissible attributes.
  def beer_params
    params.require(:beer).permit(:name, :brewery_name)
  end
end
