class SessionsController < ApplicationController
  def new

  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => "Logged in!"
    else
      redirect_to root_url, :notice => "Sorry, your password was invalid."
      flash.now.alert = "Email or password was invalid."
    end
  end


  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end


end