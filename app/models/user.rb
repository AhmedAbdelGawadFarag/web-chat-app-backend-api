class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
  has_many :sends, class_name: :Message, foreign_key: :sender_id
  has_many :receives, class_name: :Message, foreign_key: :receiver_id

  has_many :friends, class_name: :Friend, foreign_key: :user_id

  has_secure_password
end
