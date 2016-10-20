class Connection < ApplicationRecord
  has_one :initial, class_name: 'Message'
  has_one :reply, class_name: 'Message'
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
end
