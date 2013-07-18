class RatingsController < ApplicationController
  before_filter :set_beer

  # GET /ratings/new
  # GET /ratings/new.json
  def new
    @rating = Rating.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rating }
    end
  end


  # POST /ratings
  # POST /ratings.json
  def create
    @rating = @beer.ratings.new(rating_params)
    @rating.user = current_user

    respond_to do |format|
      if @rating.save
        format.html { redirect_to url_for_next_beer_ranking, notice: 'Rating was successfully created.' }
        format.json { render json: @rating, status: :created, location: @rating }
      else
        format.html { render action: "new" }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end


private

  def set_beer
    @beer = Beer.find(params[:beer_id])
  end



    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def rating_params
      params.require(:rating).permit(:rank)
    end
end
