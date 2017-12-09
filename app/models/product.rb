class Product < ActiveRecord::Base
	has_many :reviews
	validates :name, :presence => true
	validates :cost, :presence => true
	validates :country, :presence => true


scope :us_made, -> { where({ country: "United States of America"}) }

scope :most_reviewed, -> {(
    select("products.*, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}

scope :recently_added, -> {(
    select("products.*")
    .group("products.id")
    .order("created_at DESC")
    .limit(3)
  )}

	
end