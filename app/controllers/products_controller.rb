class ProductsController < ApplicationController

    skip_before_action :authorized, only: [:index]
  
    def index
      products = Product.where(sold: false)
      render json: products
    end
  
    def create
      @product = Product.create(product_params)
      if @product.valid?
        render json: @product, status: :created
      else 
        render json: { message: 'Product submission failed. Please try again.' }, status: :unprocessable_entity
      end
    end
  
    def update
      product = Product.find(params[:id])
      if product.update(product_params)
        render json: product
      else 
        render json: { message: 'Failed to update product. Please try again.' }, status: :unprocessable_entity
      end 
    end 
  
    def destroy
      product = Product.find(params[:id])
      product.destroy
      head :no_content, status: :ok
    end
  
    private
  
    def product_params
      params.require(:product).permit(:title, :price, :image_url, :description, :sold, :buyer, :user_id)
    end
  
  end