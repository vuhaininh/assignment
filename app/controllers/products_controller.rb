class ProductsController < ApplicationController
  before_filter :signed_in_user
  def new
	@product = Product.new # create new product instance
  end
 #Create new Product and Save to database 
 def create
    @product = Product.new(params[:product]) # Create new user instance
    if @product.save
	  flash[:success] = "Item is created successfully"
      redirect_to products_url  # redirect to product's page
    else
      render 'new'
    end
  end
  
  #Show Products: All, Filter, Search
  def index
   if params[:filter]
    @products = Product.filterType(params[:filter], params[:page])
   else
	@products = Product.searchByName(params[:search], params[:page])
   end
  end
  
  #Delete Product and redirect to Product page
  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted!"
    redirect_to products_url
  end
end
