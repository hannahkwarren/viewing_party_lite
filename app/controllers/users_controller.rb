class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      flash[:success] = "User created!"
      redirect_to user_path(user)
    else
      flash[:alert] = "#{user_params[:email]} has already been taken, please try another email address."
      redirect_to "/register"
    end
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end
