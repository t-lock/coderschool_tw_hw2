class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by_email(params[:username_or_email]) || User.find_by_username(params[:username_or_email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome home, Hero. Chat your heart out."
        redirect_to messages_path
      else
        flash.now[:danger] = "Incorrect password. Check spelling and try again."
        render 'new'
      end
    else
      flash.now[:danger] = "User not found. Check spelling and try again."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Safely logged out. See you next time."
    redirect_to root_path
  end
end
