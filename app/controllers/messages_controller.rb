class MessagesController < ApplicationController

  def new
    @message = Message.new
    @sender = current_user
    unless @sender.friends.present?
      flash[:danger] = "You will need to find some friends before you can message them..."
      redirect_to messages_path
    end
  end

  def index
    @messages = current_user.received_messages.order("created_at DESC")
  end

  def create
   @message = Message.new message_params
    if @message.save
      flash[:success] = "Message Sent"
      redirect_to messages_path
    else
      render 'new'
    end
  end

  def friends_list
    @user = current_user
    @friends_list = @user.friends.map{|friend| [User.find_by_id(friend).username, friend]}

    return @friends_list
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :subject, :body)
  end

end
