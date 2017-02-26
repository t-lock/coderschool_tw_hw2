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

  def show
    @message = Message.where(recipient: current_user).find params[:id]
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    if @message.read_at.nil?
      @message.mark_as_read!
    else
      flash[:danger] = "Sorry you already read that message on #{@message.read_at}. Messages can only be read once..."
      redirect_to messages_path
    end
  end

  def sent
    @messages = current_user.sent_messages.order("created_at DESC")
  end


  private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :subject, :body)
  end

end
