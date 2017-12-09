

class ProductsController < ApplicationController
	def index 
		@products = Product.all
		@us_made = Product.us_made
		@most_reviewed = Product.most_reviewed
		@recently_added = Product.recently_added
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

	def create
	    @product = Product.new(product_params)
	    if @product.save
	      flash[:success] = "New product added"

	      redirect_to  products_path
	    else
	      render :new
	    end
	  end

	  def edit
	    @product = Product.find(params[:id])
	    render :edit
	  end

	  def update
	    @product = Product.new(product_params)
	    if @product.update(product_params)
	      redirect_to  products_path
	    else
	      render :edit
	    end
	  end

	  def destroy
	    @product = Product.find(params[:id])
	    @product.destroy
	    flash[:danger] = "Product deleted"
	    redirect_to  products_path
	  end


	private
	  def product_params
	    params.require(:product).permit(:name, :cost, :country)
	  end



end