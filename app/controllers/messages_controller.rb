class MessagesController < ApplicationController
  before_action :logged_in

  def create
    message = Message.new(message_params)

    if message.save
      ActionCable.server.broadcast 'chat_channel', message
      render json: message
    else
      render json: message.errors, status: :conflict
    end

  end

  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, :body)
  end

  def index
    m = Message.get_messages(params["user_id"], params["friendship_id"])
    render json: m
  end

end
