class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { minimum: 3, maximum: 1000 }

  scope :approved, -> { where(approved: true) }
  scope :recent, -> { order(created_at: :desc) }

  # Candidate can implement nested comments or moderation here
  def approved?
    approved
  end

  def pending_approval?
    !approved?
  end
end