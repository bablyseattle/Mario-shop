require 'faker'

Product.destroy_all
Review.destroy_all


80.times do 
  products = Product.create!(name: Faker::Food.dish, cost: Faker::Commerce.price, country: Faker::Address.country )

8.times do
    products.reviews.create!(author: Faker::Superhero.name,  content: Faker::Lorem.sentences(4).join(" "), rating: Faker::Number.between(1, 5))
	end
end
