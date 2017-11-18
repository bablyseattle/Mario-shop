class Product < ActiveRecord::Base
	has_many :reviews
	validates :name, :presence => true
	validates :cost, :presence => true
	validates :country, :presence => true


scope :us_made, -> { where({ country: ["USA", "usa", "United States of America"] }) }
	
end