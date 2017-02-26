class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  validates :sender_id,  presence: true
  validates :recipient_id, presence: true
  validates :subject, presence: true

  def self.unread
    where(:read_at => nil)
  end

  def mark_as_read!
    self.read_at = Time.now
    save!
  end
end
