class Message < ApplicationRecord

  validates :sender_id, presence: true
  validates :room_id, presence: true
  belongs_to :sender, class_name: :User
  belongs_to :room

  def self.get_messages(s_id, r_id)
    # sender id , receiver id
    m = Message.where("(sender_id=#{s_id} and receiver_id=#{r_id}) or (sender_id = #{r_id} and receiver_id = #{s_id})")
    m.order("created_at")
  end

end
