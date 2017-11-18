class Review < ActiveRecord::Base
  belongs_to :product

  validates :author, :presence => true
  validates :rating, :presence => true
  validates :content, :presence => true

  validates :rating, length: { in: 1..5 }
  validates :content, length: { in: 50..250 }

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
end