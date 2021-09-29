class RoomsController < ApplicationController

  def index
    rooms = User.find(params[:user_id]).rooms

    farr = []

    for i in rooms
      farr.push({ "room_id": i.id, "users": i.users })
    end

    render json: farr

  end

  def show
    render json: Room.get_messages(params[:id])
  end

end
