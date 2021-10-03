class MessagesController < ApplicationController
  before_action :logged_in

  def create
    message = Message.new(message_params)

    if message.save
      str = 'chat_' + message.room_id.to_s()
      ActionCable.server.broadcast str, message
      render json: message
    else
      render json: message.errors, status: :conflict
    end

  end

  def message_params
    params.require(:message).permit(:sender_id, :room_id, :body)
  end

  def index
    m = Message.get_messages(params["user_id"], params["friendship_id"])
    render json: m
  end

end
