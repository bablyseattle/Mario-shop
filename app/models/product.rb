class Product < ActiveRecord::Base
	has_many :reviews
	validates :name, :presence => true
	validates :cost, :presence => true
	validates :country, :presence => true

scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("tasks_count DESC")
    .limit(10)
    )}



def self.us_made
    where(country: "United States of America")
  end
	
end