class UsersController < ApplicationController
  def create
    if @user = User.find_by_email(user_params[:email])

        cookies[:auth_token] = @user.id
        redirect_to beers_path, :notice => "Ready to go!"
    else
      @user = User.new(user_params)
      if @user.save
        cookies[:auth_token] = @user.id
        redirect_to beers_path, :notice => "Ready to go!"
      else
        redirect_to about_path, :notice => "There was a problem, please try again!"
      end
    end
  end
private
  def user_params
    params.require(:user).permit(:email)
  end
end