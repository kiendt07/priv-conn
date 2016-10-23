class Message < ApplicationRecord
  def mark_as_read
    self.read_at = Time.now
    save!
  end

  def read?
    read_at
  end
end
