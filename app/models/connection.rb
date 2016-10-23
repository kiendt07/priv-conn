class Connection < ApplicationRecord
  belongs_to :initial, class_name: 'Message'
  belongs_to :reply, optional: true, class_name: 'Message'
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  def self.of(user)
    where(sender: user).or(where(recipient: user))
  end

  def self.from(user)
    where(sender: user)
  end

  def self.to(user)
    where(recipient: user)
  end

  def self.lasted_first
    order(created_at: :desc)
  end
end
