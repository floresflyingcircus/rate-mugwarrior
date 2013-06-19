class InfoController < ApplicationController
  def home
  end
  
  def about
    @user = User.new
  end
end
