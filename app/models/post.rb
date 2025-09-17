class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates :content, presence: true, length: { minimum: 10 }

  scope :published, -> { where(published: true) }
  scope :recent, -> { order(created_at: :desc) }
  scope :by_user, ->(user) { where(user: user) }

  # Candidate can implement search functionality here
  scope :search, ->(term) do
    where("title ILIKE ? OR content ILIKE ?", "%#{term}%", "%#{term}%") if term.present?
  end

  def excerpt(limit = 150)
    content.truncate(limit)
  end

  def published?
    published
  end
end