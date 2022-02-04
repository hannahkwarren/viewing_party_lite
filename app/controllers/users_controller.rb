class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_party = UserParty.all
    # binding.pry
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User created!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "#{user_params[:email]} has already been taken, please try another email address."
      redirect_to "/register"
    end
  end

  def discover 
    @user = User.find(params[:id])
  end

  def merge_params(p={})
    params.merch(p).delete_if{|k,v| v.blank?}
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end
