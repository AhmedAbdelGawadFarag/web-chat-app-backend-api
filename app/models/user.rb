class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email

  has_many :sends, class_name: :Message, foreign_key: :sender_id
  has_many :receives, class_name: :Message, foreign_key: :receiver_id

  has_many(:friends_a, class_name: :Friendship, foreign_key: :friend_a_id)
  has_many(:friends_b, class_name: :Friendship, foreign_key: :friend_b_id)

  has_many(:friend_as, through: :friends_b)
  has_many(:friend_bs, through: :friends_a)

  has_secure_password

  def self.GetFriends(userid)
    query = "select name,email from users as u inner join ( select friend_b_id from friendships where friendships.friend_a_id = #{userid}) as d on u.id = d.friend_b_id;"
    records = ActiveRecord::Base.connection.execute(query)
  end

end
