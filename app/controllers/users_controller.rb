class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    # binding.pry
    if @user.save
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to user_path(@user)
    else
      @user.errors.full_messages.each do |msg|
        flash[:alert] = msg
      end
      render 'new'
    end
  end

  def discover
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
