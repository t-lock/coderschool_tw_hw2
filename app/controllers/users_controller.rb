class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Congrats partner. You're in business..."
      redirect_to messages_path
    else
      render 'new'
    end
  end

  def add_friend
    @user = current_user
    @user.friends.push(params[:id].to_i)
    @user.save
    flash[:success] = "Nice, you are now freinds!"
    redirect_to users_path
  end

  def remove_friend
    @user = current_user
    @user.friends.delete(params[:id].to_i)
    @user.save
    flash[:success] = "Fair enough. You have enough freinds already anyway..."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end


end
