class UsersController < ApplicationController

  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end
end
