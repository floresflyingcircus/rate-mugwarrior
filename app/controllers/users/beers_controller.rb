class Users::BeersController < ApplicationController
	before_filter :set_user
	before_filter :set_beers, only: [:index]

  # GET /beers
  # GET /beers.json
  def index
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @beers }
    end
  end


private
	def set_user
		@user = User.find(params[:user_id])
	end
	def set_beers
		@beers = @user.beers.all
	end



end
