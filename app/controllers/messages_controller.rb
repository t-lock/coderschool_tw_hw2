class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages.order("created_at DESC")
  end

  def create
    @message = Message.new
  end
end
