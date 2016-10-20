class User < ApplicationRecord
  has_many :connections, foreign_key: 'sender_id'
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_insensitive: false }
  has_secure_password
end
