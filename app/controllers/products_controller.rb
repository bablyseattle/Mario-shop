class ProductsController < ApplicationController
	def index 
		@products = Product.all
		render :index
	end

	def show
		@product = Product.find(params[:id])
		render :show
	end

	def new
		@product = Product.new
		render :new
	end
end