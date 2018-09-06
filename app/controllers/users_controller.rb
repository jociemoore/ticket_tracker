class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:name, :email, :password, :password_confirmation))

    if @user.save
      flash["notice"] = "Welcome to the ticketing system."
      redirect_to root_path
    else
      render :new
    end
  end
end
