class UsersController < ApplicationController
  def create
    if @user = User.find_by_email(:email)
        cookies[:auth_token] = @user.id
        redirect_to root_url, :notice => "Signed up and logged in!"
    else
      @user = User.new(user_params)
      if @user.save
        cookies[:auth_token] = @user.id
        redirect_to root_url, :notice => "Signed up and logged in!"
      else
        redirect_to about_path
      end
    end
  end
private
  def user_params
    params.require(:user).permit(:email)
  end
end