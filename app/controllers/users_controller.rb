class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User successfully created!"
      flash[:color] = "valid"
    else
      flash[:notice] = "Nah mate, that won't work."
      flash[:color] = "invalid"
    end
    render "new"
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
