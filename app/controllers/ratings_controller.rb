class RatingsController < ApplicationController
  before_filter :set_beer
  include BeersHelper

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
    rank = params[:score] ? params[:score] : 0
    @rating = @beer.ratings.new(user: current_user, rank: rank)

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

end
