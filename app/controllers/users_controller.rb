class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to root_url, :notice => "Signed up and logged in!"
    else
      render "new"
    end
  end
private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end
end