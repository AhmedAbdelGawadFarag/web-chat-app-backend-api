class Room < ApplicationRecord

  has_many(:user_rooms)
  has_many(:users, through: :user_rooms)
  has_many(:messages)

  def self.get_messages(room_id)
    messages = Message.joins("inner join users on users.id = messages.sender_id").where("messages.room_id = #{room_id}")
                      .select("messages.*,users.email as user_email,users.name as user_name")
    return messages
  end

end
