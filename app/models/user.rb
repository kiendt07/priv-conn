class User < ApplicationRecord
  has_many :connections, foreign_key: 'sender_id'
  has_many :friendships
  has_many :friends, class_name: 'User', foreign_key: 'friend_id', through: :friendships
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_insensitive: false }
  has_secure_password

  def self.default_users
    5.times do
      User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123456')
    end
  end

  def self.all_except(user)
    where.not(id: user.id)
  end
end
