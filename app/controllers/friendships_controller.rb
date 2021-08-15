class FriendshipsController < ApplicationController

  def index
    friends = User.GetFriends(params["user_id"])
    render json: friends
  end

end
